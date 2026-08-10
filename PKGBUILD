# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=20.2.3
pkgrel=1
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
sha512sums=('71e4133ea8a3ae4555289c3ca5c4b370312bae3eddb03a12779ccccb32886810b4663ab7cac0c92221c47b195437635f0619de5717e852d6361ba090aebd5cd3'
            '714a5e3bcb3a665e929b8e80875d9cb518cc203af6c1fa4c20e6b37ebf88e7dd4a8f6ef071b9176ba27423814f222b0a374411c17e617ba6b766c06df7975377'
            '62e6f48c8f1b707418d4e0442443faea95449a39f438d39383a67e433824a5c7499decdb7b60eb20a2b984313a53612da19eb4b001068efff42c2c2c4a61302a'
            '8e48d8d670eff705cb75dfb50ed2a106614342c9e56dfb60e491a767e2d566727e93d429eac18d70b774ac1a6b30d7648eb9d9ac8f947e34a2ad417abd1763f9'
            '6a27a53b06c30490f3a324b3fae5dfc50029a3a0103caf27bec29708bae9f59a33c2003fbd30e5df9741979d39402a7857764d09b8eca567aa5bdd130284f9ec'
            '52c4273f79a5afb22bdf8ee8420dedcb7be6f169bb62d3dda1f5dc39c6b2f7a3d013e4de7ac8e6a084a24b46a7dddfc71a22d215276765ce24319d34fab522da'
            '38c73cbe2a2faa6b32fa16987626cdc343bf72563720e969762d96ec53170884b5dcf7f26eb5ccf2972be2b8c92b9ca18843e77d2ebd5e5f110b2b52079c3e93'
            'cf65eff7c298889721c325d88a5411b89cfaa65ca5bb818c237fde6d1695f76109977076fff9803c35ff123718b479e231d59582dbcc3bc14ffcf26827869f9b'
            '612b99d191d44c6eb462284bbfd3380b0a4fcef51280d4611c5050aa040774219e40ab4a3848603d129b2fcaa5d10303bbe72fc3b424b777b67e8801bd0c6284'
            '57327345215c81ad6f85bc6a5ee1fa325324ed4d3184a58c7948cccef1171a8fe32a26ea1dc8d908cd24b6491e81974083cc43ce3f474e4c2e2fcf16df5802ef'
            'd05c460e7e7bc5687643a241044ea1ab7c62f3480cf22f9642727cbbde38f74a5dd49b2b46d5893e0bc30edbee3acdc3cb02f73b801c405294e97cc61bfe73dd'
            '234602016e984eabd5ae2d1203419277d9eecba1377508cb09f09759f6fa6e04d9602ee1ab5295779bac39132d3b5983c2c4806a1680de53f838e6df4818b9b7'
            '1ca52d7fca080a6aa07a43e0a91f96cd954dcd5b5e41411c12147d20836ffd00797baea5c244514ea6b63ad21a3bcf3ff860aeb9bdc0ad43e66c646baa92dd9d'
            '2c67377e9bb41e71971da41bd582d3ab3b9caa80c9a7ae0cecdb0bc6afd2536fc66c30ada737bdca9598ed24d591c3dcf60bcde3e131678183a728128fe120b1'
            'd04adc4b949b8b253c718910eacd0f8ecf384888d6d5c0f5755b96c2ef9ac43d2c81a2d78f22cd85f9e348b35c9429cba6261e5bed79ff1bbefaa405289b43ee'
            '59ca7620e0d61a77fdd226566a76f9a2d08650075d6427916581ce0ed376a415f0cb4fe607967a21aef8c03d6bf29d959809e207b6e7697586441ae72c7fe833'
            '96da3d9915e9737c54f8d7320da30f8a8156d8048eb4cf2a87fc7d177dff5e46f8781f2042c04c887e46b4d5de5b1b9398e037936dde7af42373329e169e3ca9'
            'a620997472d15de45ed3d9d393ca3176a7d88f099f57dc798a6c40c902c3884a3513d04e700084335ef07546b7f8b06f545a93e6a7e59b46c18ccc339a196295'
            'bced1e49d47e50d884794857a03686aa09750bbad2db147848ca58cbc0ddc6f5fe83b0c67604df737f4be8b51c367b67b59e4525073ad9a62ed9e014562247f8'
            '395764329ad401716b14bc75e073395d3ec6586b70212d56474a69cb5790fc89ec9e6c59775feab527836263b21ab0204da01b1e25b1448574fdf9b39560e33d'
            '36be02a793888a3a48334ea10358de96ca8590f0d494f90a4d80478ff3b987d6072c9b636806904e0a56258723f58599bb46619e88357b091f6116c229b6abcf'
            '80bca41276702dc71f399bf195aa1892f7e9089ca0d84387687d06b51d48e26e2741b5899ba9c29bdef47d5768aba73ba4c463fab718a063815a7c031593c4cf'
            '84fddc9c7f3612ffca7d8eec782ec31e7d0b7d0b757f69331a113bee7992908fe399a9c2234f721d3cbfed68c54859dc80049fdec411d2e6a3dcb316d6798a21'
            '34c9f2ce5a05981270a04bce4219a22c7078dee7523e85ea182a6271372098fbae2e52a6ff2352f7f7116560228c6405d09f2120fe8a2b70ab3b1da91a8a4fca'
            '0b9f8550371b2ccd3b9cd3d2ea70e3d7af8174386c4d89956d10aef7b91846847c8b0775871791e4239c0306d4eccb3fb026fd34a05311ff1d73916885ed0f76'
            'aac9aadf427a106c4254a76b476361fc2a6bb6eb25b25f510486f1a526541e17052fb0e8e61b9b765848ef876d259ef6a872460733587aea8d783562a232c67a'
            'cc17a1a59ab963e6699773682fc6d8a4b2a8faf0b238c30009aac98eb49133b0b38c52872aaad9864c89fe1080147fb92819dc0d29f8fae6169379752cccfa67'
            'c8f91186790f3a42a3d8b3fe3d6d06271b8e0e882f5694f55a0f76e97a37329e16a33e2717632502d11169caa99af47e4892c3950ee7969b3084583ad55c7c84'
            '240c7c3306cbd0ae4a63a1a6614a511bc4207c8edd002dfbe4b24838051f2d7393dbec84e7b38a57c1ba0a42e99424c414302debb3c288bed30b5c8b70eb6745')
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
