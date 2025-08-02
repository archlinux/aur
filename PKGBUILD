# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=19.2.3
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
sha512sums=('5f87c367c577a315385debee5deced30889ccc22d3953022ba52fe9f551b7db1cde025f67e5a2c5134c2ab74b1f7342a734b6b5e16bf722f60c5dc569a82cd88'
            'b0663892e27d7ffa59eab9ff9e7e9437d6f0417fc58921c12bc0f14997078153899e9f0faf492fcb08a57d7017b1b7994eb08359f247591a33f0b65fa5848f54'
            'b68299a7e1f6db55e0d99122ba49b10a9695098ee83a1360a347bc737c508d4a1ff831419f011c7caa3d27005b9e63c0e37b6446774cda36fc4eb548a53ad048'
            'c663ddd20a83c02d1fee2bbda6f49298d81bf872cab636ee58db9d3e3173bc2da5b17ad065653437d6df46f5af36b64a0ef9be1d1600c8cb7a73062cf7a1b9f4'
            '27fdc9354f5435dcf6340f9a0aff1c4cf2d73c9bf1d94dfd9fe6d9eb0fedd0ef7d4b82687a11535e245ffd9b77ae9d6742b7be637cd42da82d95c2ec6c801fa1'
            '4c39813c96f2fcca61360a42da653e82f5aeadec5d5e4ec0335618600653f7be859d9ed0fc049b6e1c29b32ac7cb14805889ac2f4218931ab263d3d2c6d4f471'
            '1e1255f61c67f207c7188b7ff0f9e4237346415d446848b6c8988adefa0081921c4a742906da4a8f3702b7d079d345559e27254cb2fb4941a033d926f493958c'
            '9a0ef7a96f39501914bbb9dfbd11571d468a39f9f3f02c33f9c8e9c98d7d503bfe88b45e8f17ec61216615798c8244406a5ebeccb6f8d2a5fff497dbd3c052f4'
            '9e391344e6f00128141791ba1338a82166a37475e04b16543d705c5932193b41c7424c4a88a973dde75c7f3cabac6c0976efdeb9302768b561ed8b819d804fbf'
            'afc7711337b9eddff5d89edb998bfde031bc64530d22c850556389434a4d05cf8aec1ff1796dc5fca0aae866c16ba22838559b6375215391b0e03e1c02dab640'
            '801fd2e4248a139d1b3e3049c2b3536f233c438988b4d98ccc7423f86698816d2d9abc21786ae664b72a0dfff7692d8780a19937edf10c194a0914e5591f5d31'
            'c446b4f1f12f5650eafb055bda8d1bf649f74a2253c0819e7bbf8c75a14f9d86d5db4b5417baf1ae53d40799ed9bb0dd3a1031e261e1fa4331087134ca306393'
            '84f15bb980bdf585171f5802ae7ee5f73c820fbcfdcb0f5e2085d801d72c242aaac7c86b11ff643ec569c4775b1b65da823fcf2b32931a3a1f57bc944468a37c'
            'f245e25e7e1aa6e3ffef8a59b00d12a9d21f1222edcedd88151b8e846b870758b0610e36ebb171a0326cc3f92f6fcdec5f0c70e14a258b809528ec5b1081d23f'
            'a1f090bd70aaa432f60dfd9031c5f25916912db8bd8853f4b1aee6e6b30f157f0d7a182c2d0a24b0a8f9882197f9201f5bc616853ce5ee5ea03fbf7e49a77011'
            'd77a6b3c4ac946a7a8a3360180822ef6324903470e83a00ffe47cb80e4f5ae5664caf7a1ab0b66fb35a6d1daa86c320acb5594a4f3db372ea9f2affa96e7eafe'
            '7346922cd139b1023fb4cc6d9bb8117a6cfa7758b150e5c9875059c7e7fa432f0aaa27a393d9a2f55a1d28caa60051be5e4d028c757873fd403360c93e4af28d'
            '7f6fe90ab54a301af6b9d996a03c12b806318dce6f859a8e0149195d8e942743391a57bbcd5260c85c525634a33777b05f3d88da4aa3951fb0a5d66cd7d290e6'
            'f6f2bad0e9761346ee534c0eed30494f88e291a71c32c36055c61b5ffe4ab68f776a4ccbe2e22d1dcd7af9f2c8b06d349877fd824c8d1378bcd3da978b6b49a1'
            '5dc06b6fbdd99ea2b3cbfd3b8684a300da28d973d8c19448af2e993d83e9b4065d2d581ccc08e58e3dbfc14527c3118d88497178c740a050c6c24681676c613d'
            'bf00e89cae5578a1cc75ba06582507012612aaa45e0e7e210a7d4d6094d8e81be00d1bdb1c64c3aaa4c55dfd2e0c60dfa32f59bcd3dcc8a8e67a40668eaf2117'
            '21388cdb287c30a82cc590d29f78f53f2174ba053f14eef6d9df36835357055a12f2a42b03cbd70a797417fdb0d91c7c5391ac33df10d3fb92452977df055922'
            '703e2d0231a91800a3c2f541c764cc68909920f489314ea826bb3ec66444f35c6027f028a3a0fb8e67d8f240b8252dedca55deba66293f43e146671d688710f6'
            'b12cd4fe69450707fd485fdcc6a53a42318bea31f943ebf9ebd0987c31edc757e4e2bbc13bca6575edfa34ce98075b1385f78ce1bf6e79c8bf050c8457598ce6'
            '29981b9ee3e6516662bf0414e9ebfc014e86babd27fe66e6183011d4014f3d13379b3a3c7eb90a432dd03b474d8b05a21355bfbed3118d2b8a06349ea37f5ae1'
            'a2f60e11f9c70aac71cd121c20b3872c1a781e7375322bc992755675bb708a403d7685f024ba9cf96105ff2f36e773fb46ed05ad3e2fc875513400bd28719ebd'
            '0cb3deb6f16a6abf8c376f169fb605b92db91e52a285d54e65bb51009e6116a6f014406f8bfaad8613a9c2bde1fdd756e64a42ab48153249095a630d4b40bc67'
            '9e9c2b0cd37ccb120dbf98e423de13480bc1f9d6d5a0d298225f88bb640aa5df42e9eb8d1df99783d535eb56b8ddf5e155ccf1ddd277c67775d3c320a3e39462'
            'c3298eccb6e5f79de3d73f4b3dabd07d1f9a76134f5da2656ccf7068d4b7e7f22e3c874afe671069785987f4f81af2b039a25f2dd19327a9c3846f2463703888')
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

    'bash'         'boost-libs'   'cryptsetup'     'expat'          'fmt'
    'fuse3'        'gawk'         'gcc-libs'       'gperftools'     'libaio'
    'libcap'       'libcap-ng'    'libnbd'         'libnl'          'librabbitmq-c'
    'librdkafka'   'lua'          'lvm2'           'oath-toolkit'   'python'
    'snappy'       'sqlite'       'systemd-libs'

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
