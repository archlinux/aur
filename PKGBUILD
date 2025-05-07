# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=19.2.2
pkgrel=2
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL-2.0-or-later OR LGPL-2.1-or-later OR LGPL-3.0-or-later')
options=('emptydirs')
_artifact=v${pkgver}-${pkgrel}
_ceph_libs_packages=(
  ceph_{common,compressor,crypto,erasure}
  lib{rados,cephfs,rbd,rgw,cephsqlite}
  python_{ceph_common,rados,rbd,cephfs,rgw}
)
_ceph_packages=(
  ceph_{tools,test,volume}
  ceph_{rados,base,mon,mgr,osd,mds,rbd,cephfs,rgw,node_proxy}
  cephfs_{top,shell}
)
source=(
  $(
    printf '%s\n' "${_ceph_libs_packages[@]}" "${_ceph_packages[@]}" \
    | xargs -I@ printf '%s::%s ' \
      "@_${pkgver}_${pkgrel}.tar.zst" \
      "https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/@_linux_${arch}.tar.zstd" \
  )
)
sha512sums=('599b26f140b1fce8c2f31a107f918aa3f1e523d92b64cce950197cc09b59f3095b209edf705dcc7fa271874a63c8a22a480ea58c6f72f26bb780390544f6a3c7'
            '10cc53981173c6e3f3af81829b2a6bd7b8c16a9dca76dd6c9577b0f562c47a1e8780819ac27029e5ba30357eca582e68db5f9a4280b2bf52305336a0f5f1fd41'
            '0eb1ce0719aba0b2a95c07ecd51c489f5d29dde8c690734547d3948bd332688c6b783982c1329d694ecc28e3797dd7b4a14018a3342c5fe8c329f5c5eec1d77f'
            'ac26f10ffe57d264431b17b4abe7f458daf0a72a7fed5c2d74f3fa4452499ba97416b70d468b4eb3d392521bc46d3f8fc82a5a8a5185595b3fefe6c6afd3d5ac'
            'b5fd9603c106d92b1b1cde7f8288cc04fca33941d6271db0323a89672e5a0cf577b4cd45973d0cf858ee133dac279929db43668e05ca706cf950e8e4dc222889'
            'c396412f46572160db8947a5b198122a99d5e27a6a02c327d16bbc3ce8327a305d26c0bd5e57682dd3751d4bbd0ae02d43d9961555ce99417daa89cb45e46517'
            'eea6f92774391ba250e22c1d065e48067ddb1cfed26dc428071b03d94247dc662dd4f868da10aded3584612d475ed0430fb28d5a5e89dcb43b286bb45b7d899e'
            '52dc196d7e5b12fce213f1d56a4eadbca019a250d65b3f1f6809bccac7a3ae83a51566a54caa14c78dd25392c5a5790778554e63e6264af480747fe43beb31ad'
            'e1b259ef2a8c8ecdcbaed8417a30b044335cb87234599d6517b1a48680ca6d23a773637df547c0142d334ff0be5eea23ca238fd58d3faf29b34a0129abfcbc3f'
            'e9c8e06fd3b520e1246eb4793bb958b3fff11c4873290c529d2d142975410f6b0b3b77bbb9bac3a31b19202b1f527a4a41fc87cf9cec0beb5cf304f9963fb8c3'
            '362fc1e0fc8d0d56ee13358e00966805a36fa941ed520c95bcd04f8da2873d2d3949b6decff481a4e85d6d30f993c3d47bc8c12d0b482a3befeebd2fef72fc40'
            '307c09425d81f2cd4b62b6e4a94d1d7cdf59227b38a4eccb37c5f44ff9c36f6c33d7296f26d875a1390a90eac2d1c4b18b81f5949b7d9d7e9057ce102aeb5869'
            '19e8fe1deff9ed1ab496aa1eb19b10096cd59c12d67625d0cad802498a17b43c6092e7907aeac895aa171787a0cac6065fe07e89dd10fc57e19b8e5d6f6e999b'
            '31803407db87470d8b6e6265660777a6d5073b9fbbd0ad69ec7c87a8b49b7ec466484d03beea4f12585533bec01548c7de8bd7ba5905b5d759fd60b510006f2b'
            'ee77547437cbd86e8be001a28a44d2578af606345133b544ba964167b6001b74a87ff6a1b92ef2cb1c6f8d950d3886428443d09bfbbb7933aad22f7ff37e2fd8'
            '67bcf64088fce76d58fe0de63beaf2f7c7e40107f33edc4e10581a6310d672a754f24f5bac6469d99d4a67cf600672b8d0f59fb66114e53bb52570bf90bb6c3b'
            '749bf7e9ee91a66a0f6a28354862b23ea353a4e465db9ac92a6f16fad528a5124862e354b23532e1fd1c3f7569760b9e4ecc93b8e4b1217212dae360b8d6d584'
            '208775bd5bfebdd6dd53ecdec5240ba8ef85fb7d49fb9ba87ce739a05f6c335082387d27ce08ad9ee7e8e1c7edd1386070d667f0b227f4858177d812f644e63f'
            '55d6c796834e3e8d10e9535650d2e7f4fdd436173d34a4969db9ae0fa267e4ef88a3743c739512ab572bbca07943e18d18ec6024d54a45feecba8c8237a45131'
            '7daad725d9a549d318e893252daf99710716c0b388a9cc187aaf83f2af0621c599bb37d2aa9db4fe61c88b3bc5f6eada41a1a77620c009c2904a2103cc1b8556'
            'f5e6361572e83dce7987cf124f96c357626b945e47392c62d17c8e31347b2dab8200c8b9c260077f2988cc7997667e9f6e07256c0bd4ade44b9a2455849121d2'
            '323c93d152e61ea20e237de787fccf3d22593fdfcd532cd5aea74c2b065155bfc058d376b3301219261e39c47496c0dc26bf7bb240172d0fc7f341890c9b8cfa'
            '16542a42817570fb00e0cfa43900010bf6e27dc163835809f37ffb5f3e80c9bbd3740853f823fbb590b549291557f6ee2426f83d9e9b14a4b44cdfdd288fe3e7'
            '05cfbee34c059bc65b2ad7c7d86e3af8abfbfd7cbc0dacdec5c802cfcd961f4d56ed380214d452d23ae774d4de6bcceed765a14bab8e1b96beed107b07ab6f8b'
            '603527c3423941ff2c1c5ac3186875719ac8579192fc751b7b0c86fdbe8cb028e90bd372ac19a5ffa4a814127c8cdd88954ece8faa2383d55edc9681afcdd243'
            '0e41e18e20671b256af24f3a105eccdc3889ff64b81ed3e827e35a2b396d807682b6d6c696e8b32ed5e2f7f4a68395b9747dd15efd3fbf740d32c0acf6f8f4df'
            '51b248a97c848d5a12c15998e6cdb02c72889455c5ace1cf6fe3caa553819d798d359993e9d773ff1700601abebce7ab662f2beb1cf6d751b5a3792e40361dbc'
            'fea63b7f73e3ce9bb114add62fd5aeb1c9ce0216dcd16e747b2552f5d25dc832b4ed1f08e6f589892b0b762cf836dcc3a1bb349aecdce8dd0ee983e14afeaaf6'
            '1fb12591aaae15c6b22656f254296b1ec094bc1183a2e11ae51dc58c28e59756dc486a6d68060ce0c6205550f0a1c33a1ee222b18892ced1d131ed610ceab7c0')
# Don't extract source archives
noextract=("${source[@]%%::*}")

package_ceph-libs-bin() {
  depends=(
    'bash'       'boost-libs'    'cryptsetup'          'curl'               'expat'
    'fmt'        'gcc-libs'      'glibc'               'gperftools'         'keyutils'
    'libaio'     'libcap'        'librabbitmq-c'       'librdkafka'         'libutil-linux'
    'libxcrypt'  'lua'           'lz4'                 'nss'                'oath-toolkit'
    'openssl'    'python'        'snappy'              'systemd-libs'       'zlib'
    'zstd'

    'python-prettytable'  'python-setuptools'  'python-yaml'
  )
  provides=('ceph-libs')
  conflicts=('ceph-libs')

  cd "${srcdir}"

  local p ; for p in "${_ceph_libs_packages[@]}"; do
    tar \
      --exclude='.*' \
      --zstd \
      -x -f "${p}_${pkgver}_${pkgrel}.tar.zst" \
      -C "${pkgdir}"
  done
}

package_ceph-bin() {
  depends=(
    "ceph-libs-bin=${pkgver}-${pkgrel}"

    'bash'     'boost-libs'     'cryptsetup'     'expat'           'fmt'
    'fuse3'    'gawk'           'gcc-libs'       'gperftools'      'libaio'
    'libcap'   'libcap-ng'      'libnl'          'librabbitmq-c'   'librdkafka'
    'lua'      'lvm2'           'oath-toolkit'   'python'          'snappy'
    'sqlite'   'systemd-libs'

    'python-bcrypt'     'python-cheroot'     'python-cherrypy'            'python-cmd2'       'python-colorama'
    'python-coverage'   'python-dateutil'    'python-importlib-metadata'  'python-jinja'      'python-jsonpatch'
    'python-packaging'  'python-pecan'       'python-prettytable'         'python-pyopenssl'  'python-requests'
    'python-scipy'      'python-setuptools'  'python-typing_extensions'   'python-urllib3'    'python-werkzeug'
    'python-yaml'
  )
  optdepends=(
    'smartmontools: disk monitoring via S.M.A.R.T'
    'nvme-cli: disk monitoring for NVMe drives'
    'cephadm: Required if cluster is managed via cephadm'
    'python-kubernetes: For mgr/module:rook,k8sevents'
    'python-numpy: For mgr/module:diskprediction_local'
    'python-influxdb: For mgr/module:influx'
  )
  backup=(
    'etc/logrotate.d/ceph'
    'etc/udev/rules.d/50-ceph-rbd.rules'
    'etc/sysctl.d/90-ceph-osd.conf'
    'etc/sudoers.d/90-ceph'
  )
  conflicts=('ceph')

  cd "${srcdir}"

  local p ; for p in "${_ceph_packages[@]}"; do
    tar \
      --exclude='.*' \
      --zstd \
      -x -f "${p}_${pkgver}_${pkgrel}.tar.zst" \
      -C "${pkgdir}"
  done
}

# vim:set ts=2 sw=2 et:
