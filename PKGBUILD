# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=19.2.2
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
sha512sums=('5a11a084cf3a15eb3b4bd176d61e40dcaba925321174248463c97a092c19cdda7324503653aefa405e29daa66f96defc74df05a38a8f012115fa01ea3a14faa2'
            '2306fb076a2930747230f9eb987322449dde150f03998adddc258e3058e2586efe73b454f667a2ec39d56e4ef08b2c6dae183b4e0d0e443b79d1164663ccbd01'
            'eb2a551fb798183d9dce13a8bad6fb49dcbacffae5fd08999cc196947d5047d61732d48d531e701388c734745e8cd2f251501daf3be27c17a3dd43ee6ee0e0e2'
            '2979a64a44535e8c485f9b70d32092931e9958a0eb88383cc28562c26d1eb6fe2b7db9edf6f72add9afca22a1e93ecf8fd81861f583925c1a1b0cbf3cc2ef995'
            'fc4deaecf42d781cb1db159dac003a41daaad38b5e07a2ff22a55ab67ceade1e4e998fe2984722f5c805bdb488daf3a7a54a3579d1854926fc0879cf083599e9'
            '322bd26dae80112b604fd9c5d10ff27970b1f88894aaf65ff14f92e96d3e73aa1c4e528a7f816c3867ce5311149a7a3a0a1e641dd2e5acc8b99d76ccd391cb57'
            'bcf5e04dcbae130ebcaf4b00fc886f91c4c495b0bba159a87a3b52b16dee79e844ab30b57d8829cfaf478bb6dbc879df4bee9e352479e82e9cb5d1665d923fd1'
            '02320edfbd5ccd1f56e44ab73549e136aa85865c2832f78012abcf08b2886acdbeea267d2cb4dc821eda320b2523cb16fc5bd55b700ec9ed45c5542332b5c16b'
            'd3cb7c3cfe89361fdac33d3adbeccca750c96d96fe58b62b8f849636d80054e6a1ee77d22d885ccb5f04aeb7c78d7dd27c356312768f4cdfb9ac42f4f7b0ee33'
            '6d7adc5e7594551e727924086941981b63d711a9cd1a34e52dff5cec3ac98e28ab18f7b55afd60b65b92261ce7efe9979d80f951658e0061e7694d5066a88167'
            'cffdb74548e5804547ad85dbcb66d6ca0232b72d75769dd4bd65b220263965e06009c5205aa320925fda6bfe901fa55e167f330ed0182f82ca797e5273d1d91d'
            '58c9a559f8aa647f372695bd95127464bc694d8e0a09b23b7cc124d38693fa864baa588bdd84a7846e5d4aa2c4a789a82d6cce71c04c9b4bee13a040f91ceeb6'
            '7cc9ee8a5795f63334773ade92040353e85b87ce1274d99e97c7747cc882c9f9a8e70ec55fe21e9de876a3f8fc5f5ae43016cb0c6aaace5e2fb4c05ecc7cb442'
            '98976525693b527c612f65a1a32e5118cc0a51e8472421eb021c7375acdcc4826e9d653c7598880bf821e91b244bb71610205cf820b4d4959cead981280243bd'
            '51d709a1e1e9f2289310ecb4a88cfd1a782576ee44ad54f06ab688b6ad0763503297bcff2bbde44c8c9d1564f451254ebc3a52951e797760576c95e9e392af5d'
            'b12afb2875ab45c6958c73ac4b2a68d06a9a38ab8e518545f28a8205c26887112e0e8586267d02c763566efda48aee0ee9d2450783da67f1c1c8f323ec2e7c46'
            '5dc077aa42fe75addcce1e1174cc0d52cd6e4ac9ce3056d88cca622acd0732300b1d78488d7299d976b09737670d9964830b02f1b131b5aeafbbba0355acc0e8'
            'e941811536d2fb8f9c5c99f4f4ec626793f868cee8e3cc61dcf6b70fbd44021848f5fa65b76dc8895c0ee9c52999b7307fef75709060ab6a652a401aa24b2eb4'
            '86c360aa23736ddc8e9b9903854c4cefefb36012887eb024542a5c1a9d80b61fda96dbbef733faa0dce66bd1c72c220ab383b96baac15d68c59a9bd33f4e26ee'
            '7cf989d2dbb27d22cd8bdbd161d54bb5070d24c87b352438395a56f0a8fc6941900db332cf6fb2c1ea4c9e7445bbf33446ceaeb9de7caa87dc942dec194db6e9'
            'e54addde7db5852f5240a418d2d326a1767b6419c0bdc214ec8bae6b049bafbd52226b0e28e8ed5e936d2fc8b961bc3cef1a8c21fd6f4972b883614c5ddae489'
            '801fe8973429640e6a0a1208b3d16d56cae1cea4820a97b9afc510a015baa9aabaf42d59a3133edc56ca378dedd9143cabfa2b278083d34bf5fd9849c0ad561c'
            '81c425c26d4362ee9b1d147e6f160278239c6629c1ec840301f1f85437863e6fbaa92aaa308f755eb2803244888d14bd0d4d13bb14c29bafa0e7d50d1c33a933'
            '6e368a5cbcbddf127a9aec9e5dafd1bf35b71e3cee73c91ecb0ba3eee7d450f175b50788f1fa046b3afd746578e3d8dd2a337c144f22b6610427aabf3205beb9'
            '5a12cc5c125c6c6d88424f56e5d6a4f7d48243563ed4e99787d92d5831d77d5141de1aa66c667840713e10a45967e7be6e4eb4f3a4377d26f143377dce9a4631'
            'd8a74f5ed81e3f67e2f8161123f688180264cdaf50c346a8e55b67017f6953d68a58963647c0b78ff40a4d662e22f1bcb9812589722a4d05e50214f9686d5165'
            '5d0e4d4798f68205fa1cfc6a0d482330520e0e2adadd5e3c8d28a24438dc0e428835e40e1bdc1c716ce1661445ad64189530ec8f5a434b4b9caf5a75a7247ef2'
            '00631ae0172a77c33baf62294522f5d06df02157be2d3f7a74e17e2ba8aaff00eeea9f466907f500362b2d9fe76307536c41e82c12b092bac0e8aaf17085bd5f'
            '53dfaab27f2fc7b2b0167d5c700aad83caba3e68b80bbf405c5ed7b093784db8ff1c2f3c9231439a2f82ad4ad58bd3806b6da32f5e1cfb530362c783a7224b8d')
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
