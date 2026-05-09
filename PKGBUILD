# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=20.2.1
pkgrel=4
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL-2.0-or-later OR LGPL-2.1-or-later OR LGPL-3.0-or-later')
options=('emptydirs')
_artifact=v${pkgver}-3
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
sha512sums=('c40c4dda98b1050dd38075131e0545652c598a0a447646ddd8b8c85d7d506a04814c12a58c634abbed63042d52e33dbe1d6669c8c2b730ff1d9edd1043b291ce'
            'cc321ad03acfb9502ee1c4f3cc81f0dd55c8ec8d97178eb7cc1cc60e5f295240c60198b2c94a886402ba0feda7d172f7ef5c4df15021a9f80c5b4ba69bda437a'
            'ea6dec2601a5cab1a5e20162fc330765399ff3052467ca8503e5349f1a2083154fb3666dbb52745bb673d91465a5803f7f82a1b9fdbe6f5f080f5eeb3ef77572'
            'cc5d31624af0ffa631c4b7ddb809f148ddb74b676878364f5e9cb1079eab353f0795f8f36c43b0424455c7c1618dfc0e65a6d9656045bfbf07e801672ca079ab'
            '3f187a2ac443e2fd416c9ebe741fa8fd51770b45f821ec5cacb48136c95cc5cddf9ddf2c07a9cc7149bebe31164bbbdec5120b637b114f600f03599d9b3fc8ec'
            'f9508df758abe69a6a83b648e58687ac293ad75d09b5ab2d7dc01d8c41505ecefe5310bc0b156bf5fa45ade6b7c230a91f19dc36c1fe0797c45b84b2e408a2c3'
            'd1abcd9fb7d830b70a114bef398732a3088506906493048d2f08cc99936f7f851e14a68a9244072ccc7a998b810f6bacc30260bc8c5a978a82069542011dab04'
            '0b4c818961d04727eb12b86efad58e76f3612788fbd28198c79f74ced94493fab693601245239bfcacf944a3c953772e65cf10f58153df3d296abb3af34036ca'
            'cc5b18fa5162e64ecc2694bb1afa92250a554ad6ffd8ea9e49b11182a668af05b994dda27d75434cea5d5a4644e6743b5e6be9e04d9845158a9f259ae4ee5590'
            'db660f3beff59614a9efcbb630bbdb114a9c6faebdd9f0da45318badc6336260137dcf96e2158f9dc7ad153cd0c4fc9675acba597da670952e62e25ad5d74cf5'
            'dd64de935dc655aac7e256da2c6cefe7efb20d508901f14171f9277f4cc82e719b6244c259753d1f41484f3f155e7987afedfcaaa0a65d8598e512b120e52ded'
            '4539347bedc3cf5934f5730f15cd11c5016da7e13f9c14db9ede5fb431d3c205946d0b2499044ff14b56e6446c151b711838f932a5a20d954c684a1c26af8a99'
            '7b8d998369c850c6664211dd021a63dbbd61a9c927417d157411e27303660bacde3f5f1159781643e13274a398921ab45989e2024557dcef2e36aed7faaf74df'
            '604668e955b0277ad6d15a038da2d40574e9ee9647530e2941fe056ca3b7eef5904e3da4b81dfddf69d3950e7a375eb657c02ee42fb23c12ee110c277ef808fd'
            'c61b8c6e0aa132c56abbb98063036be155bbf69d13f400fe106fde73ff8f6badc3fc687699bf64315c56a0b8e736de6621435f13359c53f31cdc0721eb2e66b9'
            '13c3f761a863c9c4777b56a2913be5696b74f09e7ddab30bb366a4120f1f3d49086be1fd016d247502b05f6269421abd8c6e4d3e01b2162c5a0358c30a6260e2'
            '405576d5f16b50e883699488b28bb1c34b698949bad4f758300a2890a7ad664870916de6b37db4ae6f29aab0290a506cba54804cf9d27e916d37fe0d947a823e'
            'd68336ca035f3424b20d9c490a792de74ee30a0924c3ee50edd4cf9c960cd51c8bea9e02da18292e6218755cf8a4907c2250677cf1d635ee1e01d62c6a9c3ada'
            'd05aaaf49403b00c3b06d53ecfabbefb589aeff946b02621d2ac6c4e7cca70f41f93b7bc41e672c9bd9c43c464b21be13749db794228c19f89cea782960efe66'
            '7a563b9a5823548ebe2becd9a2f1fd3563116903b367a170860e51b340bbb6e45e531d5c33f799bd0d88d1203c75c78a1f270107ff9f8c03fb00ef1b141a9392'
            '24c7fb6dc975170f9967c4d99899d37c0abd85b46374458d70356894fc50fced42ae40fd229ddef3acc38073b16bc5b9a46255e726395ca1edc737d685227256'
            'e0754321ba0c54ba577f210e7f098d4b7cb7c979a1319092c7e9221e1724eef3fc2839779d35f7de02dafea164c367f2b9c503355cdbaf3145d6deec7ae3eb67'
            'dc4d1ceee3b83d2b16f27091a1d2ee688685321af60b64df76239c637d584988a434250d219caa43e86aa369182fe93d822d3342cfc3261d261f773e96b63874'
            '4faf12ee8d8053315a987d54ec32b3e10bf17be4f2a777626bee3a27dd5845f6860640e5cb601cf5ff789f30c39fd45e4f3e4246be6345c70697427897a5eab4'
            '9b57716d7a5ea04e3a859346df3544db1505c6811183552276373ed47c49446e5b7405f35c14d8ac816aa9388f25c8c47898251a24259a8e309ee9a8fe64b797'
            '9512ef1c154f05c8ef451d61ceff3a7426556636b9492aa0b48cff6257955cc6c7e12becac8bac6a1e2977be9801d904d63fb6acfe55aca84ea2919f55854214'
            '476cf729175f6268ba47d26bb59c46fa1af207923d9d604850cc92057d7aa5436bbd75924bc3622261b73352ae3ac2d3f85a61d80d1631d231344d9608b74f6c'
            '9f7c34ce805ba4d153186f0e1952bcb35a265e963d66f23af992b0ddbdb6ec4be240de265659aa7c316a7f0e264c51d4a9048ffafe4a050988a69ac683044cf1'
            'c5e19198387491c93fd0f4a50b8f5db3d714928d707127179cecef467d116e92da922ec7f9a4128e49cfc82cfc214fcbbe86939e32316d027acb8b75b8585e6e')
# Don't extract source archives
noextract=("${source[@]%%::*}")

package_ceph-libs-bin() {
  depends=(
    'bash'       'boost-libs'    'cryptsetup'          'curl'               'expat'
    'fmt'        'gcc-libs'      'glibc'               'gperftools'         'keyutils'
    'libaio'     'libcap'        'librabbitmq-c'       'librdkafka'         'libutil-linux'
    'libxcrypt'  'lua53'         'lz4'                 'nss'                'oath-toolkit'
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

    'bash'         'boost-libs'   'cryptsetup'     'expat'          'fmt'
    'fuse3'        'gawk'         'gcc-libs'       'gperftools'     'libaio'
    'libcap'       'libcap-ng'    'libnbd'         'libnl'          'librabbitmq-c'
    'librdkafka'   'lua'          'lvm2'           'oath-toolkit'   'python'
    'snappy'       'sqlite'       'systemd-libs'

    'python-bcrypt'      'python-cheroot'     'python-cherrypy'             'python-cmd2'                'python-colorama'
    'python-coverage'    'python-dateutil'    'python-importlib-metadata'   'python-jinja'               'python-jmespath'
    'python-jsonpatch'   'python-packaging'   'python-pecan'                'python-prettytable'         'python-pyopenssl'
    'python-requests'    'python-scipy'       'python-setuptools'           'python-typing_extensions'   'python-urllib3'
    'python-werkzeug'    'python-xmltodict'   'python-yaml'
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
