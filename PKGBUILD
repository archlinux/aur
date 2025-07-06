# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=19.2.2
pkgrel=3
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
sha512sums=('e29d51a351f334d94a0fa32c00ff514aec097bec25c7e5e3035a14a7133d5d042e68785226219f782deb38ad8735e74a5be69a776a56c30c3a10afa50cdaf611'
            'c2756dd9fce98f3be4cdc4008a46554be40ae17bdd74c9da1b2a80a68c23e7ecb723098736151372cc3add402be8960115985ae5386aedc4010154319d36a639'
            'be526cb5e36c095a76b871fc2a8aa9d7e18ebbcf150d263a90f349a9bf85be1fcce2fae32724ff5a175d97a7abf651d98638265d5ebf94742c839f67593829c3'
            '90aae204d103709e5f415b81a9d61ff89a9b57aa7834b8bed6d9801b8920514575869c3d6c0fc3a7281ad8f0a71c12cbcc4d11c002514aefad0e01c1ef5d9b48'
            '5c7f944db3da60d3984315a68a1c033b02f1242896cf3b29ffaf3a510d78d08582c65fcae3bb197d4a5f2af4cfcb6c514541565905fdd0a4c8fcd296834c0274'
            '3925f8558ed817d9ec386b84d4bae970910dbb94ea50955a5920997861ed403e5cb010aa9c4591de3e346231de831eee6e969b126bf152edeac856f7e67b162b'
            '7b94adca688684792c679f2ce11ee98bbbd51d60f834ac3439eed0a8923bd78d3998aa75a5d23b82cb6c63302a3f226a55495b6af06dcf928a00567efc9df9bf'
            '12dcd163a756cd8fce2faed2d9746b6277904ae779e94faa0169b737e0bb6278716ac1a4980cc7000fc5fae7f8d43776c88fd2fdac7c6198c64b8188e92517f6'
            'd2f43ffb2aee530e63d71cf9ccb8fd5331ca2fbe0b23ea17dff7f90808786377dcdd3197bdea85d534668d568d3d160912976322d44a991185ae5066a9a73513'
            'c3655844ef1507f5b7c26260bf4b6ed3a8297d39cff8db581cb462e25231c70f1689f50e6fd1993d8dec44b3e28926569658883932e11d03aa6859a6014ee1fd'
            '23d940287a0827787439cb75cb519656acfc7b9af8d2b134869bdb74021191c967dc979ca4ffef1c2b895f8849ded82ae884d2e43862cc648a87f7fe0386de26'
            'de90e60aa7704173c51e19706ddc8823ca71ed2410e52f78ad200bbe0da3787f7163754eca9728fab740fb0b38d0fb7eba03f5d1ef6a0210431244186db9fc9d'
            '5ad96f964c6263f678890238ba04a787eaf32c6f3b87783ad461899c2dfcbbf72fc47da8f342859689702703ee41026a92b2161617bcd303e173128f9a9fb92a'
            '67a25bf3374c7e41af54f382c9ad375120c2e5e5e1416b3f5faaa6c605f9e3ac8645053eee4c0cf179dac19063ecbb01b703909bd2be16ae5d21f54c4acc11c1'
            'd7e4b02b0f6b3b27de64ed7b5b1e2d080c4b49391dc7b798f390f6004c0be95fb2def0605cd28a10a7c1922793f44bc37904d3723aac0ee5068119d9db82c086'
            '9b6481311425bdcadbb9a2883511f6aa01485a1abe7f7528efdfc0312e25da6f9db073177585e8d3fb0d217372bc3a62f3583b94d0656d7e10ec7b45456d7348'
            '81b73ec7a24d94134777508aa5e02e9fd292c2cdc01a82ace587618c8d4180f95529941efb4f01b61728c7ce276d30c943282b784a7c16cf028a97c1d1e5d552'
            '54aab6f39cf8b11015466213e2035ebccc798f53c5bd5015f8d114ebb1188e9ea72bcf1c1fbbbf84120755e431b6ae58d8e606d781948bdf8c828807e47dcd0b'
            '67a9575b193236e6275d708f25fe85640daf58a03267ca06c6bfaf157ba0fdcc6de48a0bf6f36345d90179b9166b3db839c157bc09144cfef2e780a1ab56cca2'
            'd6074fd1438b44b7f9b516769b0a15ad2daae908a30bd2d68d0334491ea7091b104dc55145a9aecb8bd9e392272e23ac3ba2fc79b4695bf145779b8719cb68d7'
            '6c6640a8d258f7651e572d0a87104a68b84031a082ef3f3533bc510a6208dba13d7991ba19e572280b01e9d8a7343f1917414eaa01f94d4f2b4b501d38e2a640'
            'f0beadbf3400c60b6136c9fac62eaf2238673f310f7d9f9375af7fa7ba77b96cf63561c5c1f833b43c6826568eaa8f792005e176e10cf920a77528626da707e5'
            '0aa48afdcd3c1a0a182318b558b8d6d6f0d02127940510c365c4753ddbf63aca3ed29e0d4845dbdc8abcc7a75654f0982a1433e08dacaf799495d71f67ab6e64'
            'e1ac4e5198870e35988a4b60e387dfec5a985db3149ec3844d5f2e0c8c6900b10243bb87f476ea723463bb99e70222f51fb9b39c75fee78f35cf5486f8d67c2f'
            '31a3585d87a70d643a2ad5699b2a5bdc2f17e2aa6906b868ca529bc8a1f507cb88db9cebecd626a51423891759080fc0c1993309133eed91ab6cec61d51ae29a'
            'a7fac79c1c19e2cf53b596803d182353aa6d29a1d49e943c87c760ff3923701a7ded7bc57cb665ff7a09b2613f9f0e1a96b3613b72fd8663422fee6cea3f8c33'
            'f4ec50708a44d7b41b01c036a90e571bc0ba839719f75cabdd949d12b68eb34932ca7671d9ebe739b8d32ef553936eae554549b1ade11e77f1500d58381bd2ca'
            '13061d6efe05537872893bee805145a23f407323df10cece04c0452a4bc8ba2a78ac38d1b9c09d7c4e629024546f28b8951029be8a4ff0103729ba6d61d572d5'
            'f00c30eeedde3342a8c6b7e2b191475429559cddd90207f51e2bd2d91ea933518a268d087f4ddbba7138e47ad31f4f573baa68bf9d029f17b5fe37ab51a8df76')
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
