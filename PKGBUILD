# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=18.2.4
pkgrel=4
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
sha512sums=('c1a3139778eeb028776417e49e6fcf4d20316a60c774158c2bd04bfb6f5cedc3b5e62785e69438d102fb7e55c67e77d893ba3f2d7d216ea0a1112bb356a7a95f'
            '92b415ccc236316a33afbf3fad43ed68c4dd54f3960905f19f95f09562d34cea80e71a96c7419e2c3f7b78f5d3eb11e2a642a68b4b08f78fabdf05b185aa1a76'
            '2b6bdb90227f7b76db4c80ae786b92a96f92029f7464b61e6576e178bbacc45e6b819609f098278d04e04fda45b69935c8b997f1f7f0b37c8cc71174e2dec164'
            'ed554f5bbe963e3c928781e4210f0a81e7aa9a9244c6d9fd62c94eb4133f4bc4794938d13bfd62210b0ec4aa61127868ec42911cae5b0509aed63946f9fe402a'
            'd83f7adea87d48d39720bfd2293b07a7a6a4b080a1339b5e2e6415368e1a248325c8e003d8d3db117576bda704ec17d1f1e7e57c93a6d2e93538e6420a921692'
            'a2582d848b35b9d4db4e70f40a0c51e3a6e6f51fc9dbcfe5144b9dd897fb004f126a6997063f6c12b6c2f1979272a31169eb0f79821ea0401a2515f3a9163b95'
            '26a22a19dcd0c8bd305ea7f15a4a2e8b9e0b6963d947dc11c1437ff92befd50057f0ad154b4ef79b13370f076e537784200c0b9fb84173927749bb50099ae3bb'
            '83bcc5c2e83cfd847c6bafdeea4cb3952f705a3db83354c7941f084c18d4f2b731f943344e0829ef951999c76b3f252c566f5e92e894ca02b777ee94ed5e0862'
            '9e8fecfca824700ade14894f827cf135128fe6bcdcf3b48ffcc773718a05158dbbc18a2f30f3291d72f02b1855726c37710c887d89c1a108d2a35fbac0a0c246'
            '75c4dc7990d8c3ab9c3aa0301d90b3b0bf16045ad3b2251da72da1fe5001739235952102f1ed2a3a950697ec5ae29b3b1136031d805627ddb1fa1b0f7f0a8b85'
            '942d0e3a505192fe8de9bedffe7ee20c37d1ed392ef34bcaf5c6d67fe5d6d44c34b32218a0820545dcac0c09ad5c917083627fec96b1fb6a80e71abad66f2b52'
            '58ae68ed8eb48f7d4d4c05ead829daf1e43ff3696324d9c8c700b0aa9b8e80746f5edaa863f0216b3c272a5b948731e87c1bc414da980d9e97c45722684d038a'
            'da622fd9595c8183832890e835e6d798f3ac1668348d850d0917898e3ce7aa1d6a31f8f0a62e1037696064c195b0901370ca41d1436557d2dcfba2ac8a3c121c'
            '13b4033a58f116a5b23a8f583570d45cdb686b719fada74baf1ec3f1dcd0c022df0349f30c1a2db917f360c5db79a8b302949cc4708118a4420fbc069e9ac5e0'
            'b290860c3f0933ed2fd9553e422036afe5c9a1736927161087358725898bb33c766468d5cf25daa6550fb8a2cd168ad3bbb7de6c302ffa3fb243447733bfd1d1'
            '8571a3c447e0e3ddc44c58f262b322ad461163d8c2556e0607b02d50e611c0a59800f07113a1ac62b6761960c2e9406a8d96e213151c364d47013a5cc24ed2e6'
            '83cab47226fd827a0630b01c58b66606efb3e4b195becbed7a479ec739e551ffeb9d336f7447a4ee9f32f388806e499d11e24a0bd355c123e91a618ed59d4dfc'
            '9d9193bf00754cc5954c70f9694735f21d7eda4e7ae4cc3e37f0c5047c57e48e037df5048c5b0bffcfc92848621502dc65be6d632fd381e566ec844d2262e8ba'
            '62f2f841f1302d2775f528403d02e6cde567b662c18c7419fa41b2cf440a16b47a7d04bc182f9d0cb45597dfe31437bfccf7abdb0471235bc2ab3aa7105d6fe5'
            '122322a54e1f374e244f45a7f9b508cad707813a9e789309d600205869bae5a5eeb3308db8e22193104108f4b1f9875284a1df25d92c248d3948f0291c36970c'
            '889e1fc911e26f365b4a4be593d3b00492b48aae0a5489850f650244a68e7b141acb66f8161a2bb91575468734dcba32aa2c2f32a318d61d82eec08062cb5b40'
            '2763700ba9d325f0b255405fde3c1a2a5b7d641f870968d27ee3d5d8d382a18a306304475a1a1d0ad9037382638df47b702a0d2e051cdce1a14fb045109e8205'
            'b913bb5e1454dd2e41888076114237522946e972030a282e39da7f29bd49c676946166e769866590e2cab572545dd75d1127262f5160ed956fd729eb8d74bb63'
            'b519fcf675fc56762334cebecf0581d19b26357a0a42ac09fb5c04069969745ac9f0422863c318336762a596f1e4fa1ea84bb373633b09da3f173c9159049ecd'
            '60d90e19ff401d9b4f5159f2d3dbeeb53057c62785e11024b4d4a96ce0fc0433f828395941543ef54325ca2b34881293f3d49309cbca99f37dc1e7ce5be9883b'
            '313c2c78a9026f618481c8c25ea0c5ac6d4cea4aee4670f3bacd33f9a0e87b5745a3f50738f8afa105b6d917e3575b27fb09a6e5a5e7ea589868e5b709e14405'
            '4534e203f4e2ef9ccc4b9e17f39c9836ca99355e2c4edb26a16c9b6fcb9cebc046192ff74b833fa78b0ce18bdff369cfb13eaac3841d4e577ddcc12f9cda871b'
            'f0c1bfd6f0c4437ee452546fb7bbf9b8b49992aa55ff9838edb54a8c31e16dc11822983eaf3897ae4cf18d90c443406da440c9428200cf7309e9858a0e218214'
            '06b3ccf88fa47c13dfecff3cf90f384e4c4f29da6b7f00451d374b55641dcbeaa8dbabe58f37cfcf43eafe2f4ec43fb2a40d1a6c4f75d2df96683105e2d6458c')
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
