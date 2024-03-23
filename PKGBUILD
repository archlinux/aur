# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=18.2.2
pkgrel=2
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL')
options=('emptydirs')
_artifact=v${pkgver}-${pkgrel}
_ceph_libs_packages=(
  ceph_{common,compressor,crypto,erasure}
  lib{rados,cephfs,rbd,rgw,cephsqlite}
  python_{ceph_common,rados,rbd,cephfs,rgw}
)
_ceph_packages=(
  ceph_{tools,test,volume}
  ceph_{rados,base,mon,mgr,osd,mds,rbd,cephfs,rgw}
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
sha512sums=('1add49b88f6f6eec0106da063a9f58f617f06328e873b12e753d9d86047e5a1258c75b43a6ea479beb35e559f2720660af8444bab4862b0ea4aa81125eb22e62'
            '0a00c063fbe0b1d6cbad29644a5bdb3d77fd71371c5d9c7dc323e2c28f2d6b04ad172eea2ee71eafeb7ab6529d1ac350ecde1ab1aad6a37aece8828c29a82368'
            'b2cefac63b3d62e36c540bd39e35fc3de83034f4e8c540a02937e49ea7fa11633d17de571f69a77b0f0bd021d0dd053197efdd6d8683003cb9f84545ae7d5f41'
            'c0c7f3bf7f4fca1708a6ac72d7013c690fe5a35ee4f5976a5d95a2d565e4d3e42e998faa5b7d9152f41dae1bb471c05ca0ff4f9f2f6f66a9dab620b1d856e026'
            '222f7c2e3527adf89006801c94004a6c9664e1795f7c341c8a30155946966aa0b7e8bef0f99678aeec23e0aa31c3061b19e8e91db262228404cf808e9c4d48f7'
            'd919997cf8e9064d55c9a41fd532b58457be7a9b59b9db326db6bf93f5cef4ac82fdf30046dce0e611968243474e31310b4ae118af47827b68a70b85fb485bb6'
            'f9b84443e13964ea042b145420115d8a9e2b5b0d37b63c10d540ed1fbb353f17fe1410837cadc3532f95a57460b3bca2a768f90a5d7c0319d3b1167ff7ea34c8'
            '7f25d241683c896afbf9d1b9f26612a59b3db2269136bf3458d95f9e5c7de02cf65a466ac4106ce0c2c28b3f7cef046fdf01ed36b1a9958eb47574aa3172b3b9'
            '5f3b6e8ce60f0df55beb4d83f0a9b87c1f92660c65a5229301fda72ad3f0c0dbcf7834baac8eeb83cf5d99194b77489770f8a847579d3ab0d50ed69d248cc90e'
            'f32fb716a2255c9c0268b394bc9ee8e3eedd56224b74f64b84b611c2e7bbf3296198a6153b34c5783cc134be88c70297b575e32b436649281423a17095842ec9'
            'e7e8ec290dcdb4f6e0fa21b618424f0d60bef31846c9657f907d5cdb1aeb2f1525493bc39386c0fe1d36739afe8b296d938c82724505bd624b9fe36d33d73fe2'
            '17ecd261755f44eac02188c1cf9285483f160d529eaa82ec5595f4b5d7aaad4ffdc307ceab22a7a4f3d71443dd04daa5c8cab9d1be2e0f45bfd86b1bb4f36247'
            '2f19518ceff8f475bff07d88a837994ea7971af6d624775ec20cc5b62c9c7f235bfd7ee900860ac9cc32304bd31559d0f3be03519d3fe16cd2d0a252a4c791cd'
            '5545e419e4fa6faf63e4be3cfe1b7a7bb3dc377c7826037a72f5587a06ac176d96b789765cfdd53226608ee85cfe5d3ccf90897b6f655ebb345f75de06f6626b'
            'a557571f0bfcb4560716118126b91ca90bcf470a28973319c9b62378c59c55755dd7635d3bb955b6f813e86ccfec0dc8c051bb58927c573f2c8bb19dd1a22b4b'
            'e156f98111b6bf3e2e1ee0a9f51b2f179abbf329348926247a3e7d2fe2c2b14c82d786d0c985fc24aeb8282fb11f21f41cb6ab2ba5486ed3f9ce921f222f80d2'
            '9360e3f85ffd97388951e9d683d489dd3e237185313e235cef737bf07227915fb50da8fc9d426a9ef0afdea338c8268d8eac08a78225a40c727459c526552240'
            '247312843601bc0665cae3c63ce535aec593cc5d01d6da44efe44a3dde05f1e81f0e2643a3de789418a9e7bbe3375bdaf503107334f994cd66d8895a5a2ce96d'
            '8fdcefef266aa6abfcbfea4b4e25483f4b6d8f83a205501da02890be94bf5736801e69a03714e373d7f1f2f2e2139e555b182e4e6f579d863ef6336db0844ab4'
            'ba231c1782faad65d2f29689acef883e6391d2c8e991cce7e3e0956ebc0d2f88a1beea3162f1a40738cb8ee4c68ea73a5750c8761d3f7dfc68a426954c0ddf27'
            '5f81b35fa10a10d3e2c23460d730f201e5084376f1d03e70f9f882da1ba6d2be94779f139f160713fd9fa4fbfcfe530646ecd0b674fc6c94cb4a8a4510772199'
            'aab3edf66bac214b2d953ba74ee4b5c9d707858ec9ad52a0c9177f802ef097cd1c51376bfb9a95f5905f1a85326a38d9554729c9ac4e887ab0ab666dfc23a96d'
            '28f030b26398061220caadfcb2ef23dd80bc9d0ac1f0900b25ac9fcc868cf064653a80028fb2a9374a95165b31ccb1b82792c2a692ae9ee7a06d690f0f4ed7fd'
            '1cc7264928effff363f4a9f0bbde2bf9de439a8c67d8a10c0c4c70afe539c4b0d243c03f20761ca580c24bb438ad143fc8362d7d44b2fce12b8b45c2eba94844'
            'c1d9c64e54de50bf2391bb4f518054595274ca5dc8da257d27acff621a5b449905439dfdc2ce6e580457b1b7abcb34eb0eeea53337c28c9dc8e63e946c4b6903'
            '05705e714d0453e3cdd03bb2be1356d6768df634f5285675f50b54b5250d75559e43e442b8fd81985d8f9a67100dbe22a4385edc96c96ae86718d9c05097c8a8'
            '8f497df8b06c89abe82ada77a2923bf60277b6061444c6490bf69a9f26caadcb5d39acf855be19cb13260847ae1a100517365ea5cb09dfc8e9ed734bd9b14bbf'
            'a50ca286267676caa58fc154cc9c3432cd6cfe8eb0d85d2f3fbb6c7be4e05513aaeac4f798cfa55a97737c227fe224e247e75b20cae5bf3945737af11ea182d3')
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

    'python-bcrypt'       'python-cheroot'             'python-cherrypy'             'python-cmd2'       'python-colorama'
    'python-coverage'     'python-dateutil'            'python-importlib-metadata'   'python-jinja'      'python-jsonpatch'
    'python-pecan'        'python-prettytable'         'python-pyopenssl'            'python-requests'   'python-scipy'
    'python-setuptools'   'python-typing_extensions'   'python-urllib3'              'python-werkzeug'   'python-yaml'
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
