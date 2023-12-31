# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=18.2.1
pkgrel=1
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
sha512sums=('71ae5fa35a6036e725826a6479e12816b453acc3834828b7a6c565be0ca9e77b109514f333365848a85e0e9e90aab5ca0330b8a5fd14d032441c87c9ae40d3f0'
            '343fcb8437919911f10f4a3ccc4db204a941be39f6428f81e1f320b23d6bbabdf25451ba4fbebf32aa16200527886dc223246f42f48a8260065ece25d25f4f77'
            'f7357ca802149318aa25fa6b467129dca8532195cafc38bd0eb631984826164d2b0513ac02c93628ecfa17472fe40cb3907000c2e60d713f1d29aa98bfd3ae0b'
            '6d6508ad74c6c97ea6b5e6f97e3b5d1fee86ef599c59047fc83fabb55792ff36675a2bafaeba7b1961232f49410961bac30cdbe3577586f22b127a2503d5a657'
            '8f2c0a088de46a5aa187e716dbd2eb36f980edf597d77f93d416dbe5d84e6aab40adf43748eca588d71fac2302bb64af66bb1540ce9a578671ea7455a1fb2236'
            '3ccdccd4e4563abab881b314a9be2fcbfb3da7f36720ee8ed77e5a1372ee52a11135d800b310300a37d43f8079e1bdeda1ad723159e837e3c2ad3185dcd92202'
            'acdc3023bcf6fe466628ec0d41e0583b31a7a6498bc8cf78090267f30d3d41ed0b980fa0130e5be0847658740b842e8623dc14f3d8b9544f78237ab0d8693a86'
            'fa86e08cce29d8b41397ecf6fb496254f03fd208ef86328af3aec1cfb4b14d9545b6857b03585e7097390d0e61bace906c6289cb0d395a3c5d643425508b747f'
            '985fc8e548ae04e54cf529d4ea42ebd586f6a37191faad21b595d0d272546e16d2dc1d8619d3c9a4aaac98ae8d4cbd90d0d79ae58236d66535c548c467412f18'
            'e104da17b66a7a78d75d1dd610dfc96d0cc7d3a16eb28e2c56bdf6e45993e2cd0cf78e6e26e865160e6f000e85969d83a85120028e3d251efdf84cb839f60958'
            '4b4238af4c8f3c43b352c4340bfee1f81993b1f735c659ee2678d49e42c2284a278d3d8184132eba5e0f8fc3373a6c3a6203fb49a3790fce7327806bd0f20786'
            '2d36e9f99199fbdc5c56a4cccd29c22fd1da977c207a31af8c61da8f105787be2444ff3666aaea0c1a850162f2a4dd73d9d0cf84fa64135f8d0bdbfc8e5ef412'
            '5603e2629ef331157ba46c4f6593db5c85b41bd99130e33ed628c33eedae96627f26a20fcbb608ed91fdf3edc11fc97ce5204c41548d61f30cf421839b6fb927'
            '19b81b8f552c1e8494f960129031938a21934b48c3d3330a878e24db3aca0e9d52a0dab7fd17e1bfb90be0533076773a47630a5ebd706e9e45fe76cf414dd79d'
            'a80a023445f982bd98554c58197af805605d733218f43304b345a37ed3e7b2527aa4fc8d7a0ee8e6d572679efd287ee3ca2e1cf30d80a1d385bdc7428db4f894'
            '1e640c04719b4a5fbfe951d1ead59459771c009b912db571ac2b0efe095222219982013c180064f26e7e62be7afe1374f0716a09779874110383fef94cb4f6c7'
            '0d38fa0645cb916726cea2ec41cfcb3fce881b0fe3996a50189bf29a9b60c1ec1db54d39f5cd5de73e68517f5427aa4e46c744f7ccf6b6af7439cb78e01d76e9'
            'fcc3cc4aa3057d036eddb91aac6acfda8bc58166f84a8330b51341b306b251b3c38f8caf5527e2569bca7e80d330444a99f726cf353ede8898133d47c92d4a55'
            'ac2ef703110b8efd8a8181ecf1364da1f0cd93dfd25e4cf310d0f013ccc7e93df733e0df18127cd59b6e8c2dc5c3359be7dc645bb86da5d97122728a589476af'
            '922d0f8eda372a7665618c0f0d3c26d23ba1bbe17825af9d0e0a42139a25dd176df699b0c60f0f199c9baf9505aafff7a4cce1cc0fa242f0cce94fcbc04d1e7a'
            'c641fdb9f02cda5f52920a218ebd63317e8b19d453d0206526a91e8f8d3956ffeeaf3729040287aeaeefe9f2fc66b8a9679cf3f8e3f6dba98582d73fc2820a01'
            '2a6a7dd62c87fd28d086987add859b302226c6b1c7e7cd8f33c618d414f70d28bc64e57368c3bc8210cd64ad5d2ec1a3d6fbef72977a20d5e4c2664e54ed6963'
            'd2778113ae361e5a72dbd92a383abed1bfc00e7d2b8f0370e192d5f7102b80e048cce76f12ffca4ee0c22281ba8e4315faeb111b2a0ff8af4454fc07875ef72d'
            '6006866c19f935b3f52f990ced4b82569dfff3e69b7bdab9b3000960bb03aae0f567d28cbae4471507ce3806c08c447b112f27dd11c23e8c78d0e555e57ff05c'
            'efe224958664809d37f80a29e2982dadb9ef73715276b8097d8da2f18b3f09fbb2e443cb1ae9ec799ada8fdabb59c58f602dafc32526ac56232e90da02f41113'
            '57f41aa460801a097953220d934e3610e517c2eb751cbf6ac4225dd185e3f40592758e962b3d7f16596f66cc61dd554807db5b064dfd2af79848e5651ca9ee6c'
            'd9d58a51e5d102e78c51a496c1d43c433f55536364ddcecea973841077133552a4c165f5bc280caec0c91afc4c3796b170696982235038dcbdf11776a866d012'
            '46f753a0b753941d1b1ec185fade103ef7c5df0e0583b5f0c3631cd1db45eb5b01d1ea1d8a999400b960ddac1ebb0381d0438317c8dba06e9ed3a75a56b2a254')
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

    'python-bcrypt'      'python-cheroot'        'python-cherrypy'      'python-cmd2'                 'python-colorama'
    'python-coverage'    'python-cryptography'   'python-dateutil'      'python-importlib-metadata'   'python-jinja'
    'python-jsonpatch'   'python-pecan'          'python-prettytable'   'python-pyjwt'                'python-pyopenssl'
    'python-requests'    'python-scipy'          'python-setuptools'    'python-typing_extensions'    'python-urllib3'
    'python-werkzeug'    'python-yaml'
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
  replaces=('ceph-mgr-bin')
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
