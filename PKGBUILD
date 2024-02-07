# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=18.2.1
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
sha512sums=('58da078b8084baebcc460a58153cb7ac5a4f18682f47cc4f510a9e13714ecfa44e2c24fbbb9e48651618c6943bca65b2861b8b6c93a4bcb17c4ba82de6c121ea'
            'a4c4dc4264437d3db4ff8f1148f2093f1972312905b318350cb321062728634def85db1a9a3422f81094b8dd4b64c5b463c449bb0bf61bec9bed51d70341d245'
            '6886e1f1b1a591995e4415950972c8d972edce238fe98e6c2a4552817b3f893ca30fafa3d63b0b92cda6f2dd90ac35d65a2cd6da84a01884e72605c15e795b8e'
            '506017e1c88a74166d6b80e07098801a523542a550026741fa1c0247aa5f21f7ed1018b549b354a5bc254ba7f0bea3f3f8e767b5382f479b8ab3ae320c9ab246'
            '02ed43d229f3d097a1a37f9efd67e715bc0beac524cc3ea48d7b79e4f25e00b217c9c5d4cf9f24d75d251887b48602d6ca11f221430422190c1460b42fd36f1d'
            'd2d3d49aa1b4fc992b09299d779278f59ec90cc701c77a67bc8d35374739a0b7a27e767c3d3bd68c717cbe943d62305f20fceaa253f95858798241016a18cb37'
            '17563ec48340819154e5ffc40de3a708dd07f036e3215409a625964baaf49ff891bbf1daf0817d75b4e3fa4c69e6155d16f850742549491e439ae92c5a2d6778'
            'fa3d5eded57550d13704ef058b41593524fc7220ac94f54f1bdb90e0e437d2401f1a34dd8954ce1775651bd6dc5d39746e52c5caf642f4ef9f2826fcafdc06d8'
            'c921487fbd09b21d22a2d57d0ca58c3df9dc4daf60914d58b98877a258fb65cac95728409116c854458b8c26c8f6bb7a4a0865512c3294a7f9bff12cb5bf705f'
            '5a30dc280058511d7fe20b8095ea56bb3a99ecdac4a9c16700ead460860e15b40bdd4ea1007e9c6583200cc17c0458306348ff2fddc85a0e252c6e2305f85b3c'
            '468c75cbc0b5053b72b270d4ed0106b848b336baf66e29da16934939e9cf3852c65faba3dffcaf707bc5629e9b6e81e93e25461da80ffc73ff915fd6b3ceb23f'
            'c4c34bba13f9f31a22b36943f3567d82599d6533b87b37f011fbf00dc01a721750a0ea8ba8f0513ccddf76ed767b8e68c5fbb8176092bd514f121e1ab1393af6'
            '45d7f76ddc610f1ed4e7065d5782e5e831ad8d74dbc20cb15b29107d358468916561d48a4e4a0ee800948149831aca87391dd47e65f560d0e20e67d0925d2ddc'
            'a7a9e3f396cff6e4cb1afc4575dedb9b715d89aa859055439b96a62b55c8f1f1f28341b4fa537c49091b10b16389559e4624d2ef6f7cad0b3ed849debdbe402d'
            '763f6ec29454e53aaecb4936b626face06ba1644d6f62e7755f90e5c9c71c067a4a09343863a64288a901822389f5726e625628f71d89ec90acf322597fe48d9'
            'e3c008cb94157762bf28ee08dd7326636cefab017faabe32b4b6579f647f031f3f4e48b5c182825bb2578339fd91193936d83c88f24754414829c48b285ae9c7'
            'f8bfdfd38d31146aca2e6f2e059a25982fb3050276577ea380c74cc306849390a3fc9fcede2a074dc41441af8ac860374ffacd98780f3f0acc3d40462cc4de63'
            '8acb4d78553454df07770c6bcf53f758a0e58092cf9aadfd863506a2c769862d2ca6d630b2829b64fdefe42821e14b9f44696b917826446cf863c74118235616'
            '6f3199ef0491804e6c96654213d6ee002ce3ae33d3aa592106fc441717a333a0d2b634df7c356b21932d2078445d9776240229d89e2d2148c78d18d62a925765'
            '2bb5a293ddbb02b3bde5df22a415aa340d7a0f89ec0d9305eb960830f95e9b303f8a8afe369501bbe7337f898824a553f065be602d0f870b83c7a46d662f8b86'
            'f6215941bf31627ee0074e4199f22f2b3f566d988e3900a0467331ce79a31c783c08ae06d5835523a5ab6f9abc0bcd914ba276b0feb64873a5ce281358c3afbf'
            '0e0ed7a6559de955d95ca1d26e7332c0f89f7056189c3b2b8569368cfdd0e657bf8843d7d9c87bed1c70811d9d80e0340a666d2ed0315a3a466eea0134616e06'
            '057e14b794c3cee36b513a205c3ceb4f31f168c3a64af32885137ddd90686b7a7d69446d22c45b99d145ec300db381953a697ce8dbd3e6222889aa419b011319'
            'f5fe0d606efa0cfaab2d319f95d396aa2b8dab85e5edba036c7f841b22a34473b99b9ff7cdc271dc157158a00c8878246f9e23375a62c231e7d2186eb8774200'
            '8b8567c673583aac10950fbd868dcccebf2415ca4fcc4c627db0acc5a93ae926fc1039fdd55057a89e83bff9537c930a027f50333226e9ab6efcf88bf43dd57c'
            '3a4e748494192f81a0b3a55b82c379ca6bd7ab9fab8fae80fc0bb516b6a5aab9ff71e95b1568a217cb4565d16e4d37fe3dd276399294d043aa02aa176ed7444e'
            '32baf89c3a65ee9cdeef7452720439a99a0891636ed55346dca42c643c79439ae7d681afc477d5f844ab49dc1ba23c2b6b3ff226ef770b88e7d86f3c3730d4ea'
            '7297a14a0350d5d02d4d2c008a22428f79040dfc634a5a4108c55c9096509f154b8f1fec599efaf681ca1bc2993467873669739f53810721011ff78080b3585b')
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
