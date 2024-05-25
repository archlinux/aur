# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=18.2.2
pkgrel=3
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
sha512sums=('ddd3dd3335200a0a23f3d5eb2f4f7ec9a7351f7e54280c4f8c9a2c7a945479efdf7d49291c546d29daa662518790289cfe15ef4cc6b204210b65aa6af0069a4b'
            '1b9366a251bc5c8bbfeaf111d8e1c16b9ae9248d0a578997a9b51bc2126a4f50b6be7209fe856932906ede43563e627c5c17f0d044c42077508c73a5553d095b'
            'd9f5f9815499687c2e5904e1671f78b6492f78836b41cc39ac4c780344aa76dbb0ba12528300aa4c81b05986bfb57925fc698d4b81c75e9e09d1cac1ffc8bd42'
            '032638245ab18fa76ad82e5ec1856e986075ec2db8aaf5e0aa9f21a2f778d0716a930f880e67a9f03578d4ea1925bb949b648e61dc141e3661039ecf1c558358'
            'e076fbc6f8fa809491f5796ff314388793b303236e76ce31057a5090487991df5a22601ff4522b5138c7cdcf3e70a053398120237aee0f3acdb463a6338c4e0d'
            'a72a33449c727ccda29fa3221b0b397c82fc8bf1085b93f81a888d7bfeaaed277dbea88a81d53b96f092b7537e65fb255132e8dc6797d07e382d9e435b238176'
            '3f690b172ff6bdad1cdaaf88c4608ffedbd467efaa6cb3dd916cc481b24a4386bd46364954e457a9d63db4d43d0b25b6f3b48f9f5087e9bef61e0789691dfd72'
            '00632c6635eb3a89960e0f23843142b2c2859c96b14d718060fe787e419538f2d4ed120394ae2a138fe939b10bf3d7757f4c9b8237867d307d1e8beb27725b48'
            '7269cbea0a1421d908db68f7dd2f512924cefd1449803eec071b207011f057822af9d1930afbf05375885e359b8c9ecadd36a9f0ad5ca15331ef5db36120d719'
            '77e15198fd069a5991709e2524c9a6b898273cf1007b6219c3d1309c4b9c915712721e074d7f476d46761cfe2edc4d8c63425a731be0dda6cf17f1bb0d432f55'
            'e68c7f1fd9e76440046f1350316875fdd8a2331431c1371b1e2c5adfd24c137841377c9300afe8e4f38efea5fb0e97faf060e916a66c6e330e90e7e44a79eb9f'
            '31fb66fe61e2882520495f65a01fca8e7421fcd462b44307f55ba7a09540a0fcacfcc90216e196bcad6b865fa5698cca20ec30ea85a4fdde1c12330ab4870ca6'
            'eba64c886cff455f18c18ed90de9e64984022fa5a521f0337ab7bed2f6fecbe2df65144593f491256e7e049d9ffccc922edbcc70c8663060feeb0df9fd5940e1'
            '2a1009437489c563ecaca10e0d5c090d5b2ad1d1f684bf1c0f56b4b993d6ee4bca113eaafa5dee8f0aea190b300435005c6bb21b52f76abf8b7bcb9c4f159df2'
            '2bd631611686173f4cd69eca8feacc55df92ae6a9e09f2c0510abc3bc4c79fa2f26608aa122f1d01fc2351013b9d8367c4b3df6a97d0009b6e90d55b7f969ea2'
            '9ec53bfda7ba68366c23450d07ca3e4a73c79be1404f658d0482a335d7cc6bbaafd8c30070e2351f66d265e76f71be3de4d23686d8c0ab4ce7e7ba24c0c848f9'
            '617f7d5f42f74e5e029f59bbbc8ce6ab627e3f38a6e22af5e654e678bb29c97e1c8e887dfe7a08435a2f781d5fedd0d5ed3a172f91abcef88a82c936bc9c647c'
            '0352a07c46eb575a5ee5badcd208f20972017594b0156376ee269b8bce65c2a94b280eb22941fe96f67e11a09e94e49e0bdf657defe05f168a540ed25638eb23'
            '0edbdbd7cd4896d3e35cf8d70a77194b575ede670ce977de858131b66e1d031c2ab6a47acfe83663938ded78d449f7308fea18958134d66493a8bc5356c75fcd'
            '652571620ab8ef4eb0d47167f374ec04fba4d30a987452617132dd2d57ea1f4daec2c38aac35ecaee89ef60f3240dd6a3e2ec166381b638a3c3cd09aa1569deb'
            'f354799b330863bbdcb830d22a28a419037749008ebdaf9fc44419d93189f9dc85385a13ce6ddc673298e283d98018f4eb6783702f14023f3943bc2e31f8858d'
            '4dec24563316820dd2e7984d29387e6a1c3afffd9adf90d08bf076e4a2c1b9bb9b0dad7aced989387699087e8c0a994dddde6462c2478acbe3571992613a96a0'
            '5012a7121fb346bafc41fd0bd17f93b81e1c7c88fedaf70b3c3c36cc90191307857725ab1e2b34b619795faee5cf4e3cd30d1747885774f1bf805c7124aa6341'
            '141bf2015c486e1ea388e9a80f6ff0af6dd392a6b40d5b1a7573f9cc1c263eea830254f4f678ac65fbd9a5456bf032e28df4370644c9136c9316d94f87194fb0'
            '7cb27b55d43f09d9863c774c0172833ca352187fd6e37f44367112f7f3eb18cf12e6500db43f839c1eddfd0e26e1291a34b6e24411f8e517e04e1a726b0bb0d3'
            'c531c215ca50de65c819f3f2b0f59dd47dc7ba0ec1d93557893105da85264e2d43099344fdb2d9e10a0e0c1f892cbf8320eba9dffc583f56561b351ecc933456'
            '992db10044dd19b0ba7d3ac3007d07b6f65f34927276bb2d34f080a9f1fb590e2258a925bb35a98733a31ae9326b2e69c7f14227ab787b068652df9e2e94e49a'
            '963f88f9a1e6f78e8b755fdb71d3ffe0c851a1b7c934466e9b2408c55dcf55427cb165cd4860f831c9037d4973e3aff4bd165a5aa4613c639b950a27dd69c61c')
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
