# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=19.2.3
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
sha512sums=('cf0c45dbac885414fbfa05c6b00a9a7c04f2d05e88b42501abc8a21d42149d55109e79d42b2bd87465503f483f51a2eafdb10363ea9d9825e0696080be8d2ce1'
            '4b9dc890a94b9f13ad78d5f58fa31686eb009fd12f45df27132cb1a35e3a491aa29eef2ba83ae328bac3290a85fbb73e77443c8e7d81bd5ae5e217b7486c8995'
            'ce7a2e50f05f4e391f1282c09d3e6f175979e20cbe696d2827b3fa8e665160518d640c90f606013d804c5a915f3cf616528baa265ae78d7a97f7c570cd1af29b'
            '1970f62a2b7119601a5959c2879472927a98512d7b33d1d968df83c3e3e661de6ec0caba73f8646eaaf332a1ac11b25dfa973543068ba6f4ab1ca7e09a5aa51c'
            '0c8dd893ff3ad3ce681baa9bbdbd94b468d746d842f85c9898145e2ff83308f30b2442e47cdb758182ea0157c01b7d019eaa0f78dcf6284f5bcecb4c3f9e89ed'
            '879e51b8d950840bb7d60b72cc36633e8c5dc6d740991fac75087b20c45591713cef09b83445c0b52801c1e6e23d9e0766837db5d58f3b7a6214c4a024b949c4'
            'f1886311796cc5dac006117f653f21d1828bf474588a3c0680cc1a48d66521f1d3ac79c1078552d8122a45fb17bd01d13169b19e2ed4e3b6401c140ae871d042'
            'ce68f7f41452d93ff671a34483e54d58ddceb0c3d609be936f8824fbce27bfce1c52b1a8007ed98011ed21c78b36b92d8bdc482d47f043a64c518d94b5cd8619'
            '9773fc6f0b82d8380da8276b3bd7c2ca2fd3c597a65912e8807e68b964f47e7a041e1c53c0eeeb052184f033b14f5050df145e7272b2a5a5a267e02c03b59430'
            '34857b1931efe460385629bc56108fde6ba838c0526d3b096ae6bf3bcb79ea8eeb98b6899fe22dd78ad27cd3af42e6bc29cb2b382b0148c8f51b6afb8c2c3d69'
            '05ede4c0f4bd4186704b94a8e784c7d86a5c78ed9754e925b469b0470e573b15292e8fae6fcb8a79d7cf4eadd0fe272532563081f846b47754e29ee99b253f92'
            'f092580b2662212bb9c9ad90a1dda9b27670a706379339a916b58d6b4c13f80b8934e0287ead02036599a65bb02c927b1f7445c7e43dbee35f909b0bd6086974'
            'b3df57d0ce5711aa223ad47f4d3b2e01cc5a05552211e1987878c6dce34d049d05629da4ec0302529e7c6ccdf34539edd2b0631082d91cd824339b2a2770a331'
            '93a894f9614facc04b47d025ba41128dafdb139d80858a1de7df97f91b4a4f5eda1f97ca4ce0e2c69c963096fb41902e654de14b960b6813bff6f51658a29fe4'
            '9f677462be9a3d22b5d9df56b5aa4ddbe09925d39aa652bef7e05aacdedba5c2e750ad78e17f595f544a1b2136a1b802aa97aa73fd683d3570a8e32f3b81cf2e'
            '43661661c6d39a1ee950baafb7dcd6a0b79d40c58ccc4fcd7b8b20f4c60da2a51f85ac31f20ad495867d9af71c30f980acb49978cd155d635b46b13bb2878119'
            'ac6b08f9d987bd167d59187721635986bdb5a09e4479a7387737e7425b32f5cdcc793f813467db3430828ed8c7b62347f0dfbcfd6a2fd3d4ee22e8d3dad5d244'
            '9f8e7c8de290f5d6fb9057ca155f5d06a9bffd1ddad495ff062a6e5809d6ecc52f6cdee63c97b979a7a3e07d5a9ef48db3e493ac4cea5c3d01b8f880396a167f'
            'eb526e12e3492505975c41cc0bed38c6689b8eb0c58ac6eb68ac1378dad9b38b61f4c7c9b034b5948bfeec4cc29bff66446a9e3e6663c8b3dc36451e170f45f6'
            '7fa82422f41d50edddf3610a0e3c1a3f57ece14c9565b163c5e567eb417fde6870b371457bd5c6c6b59ee772971f458ce6ae38d06e3f3640d41b9bb3ee7a6f61'
            '3593b177d88e40b5ff556abfcac102747d06ee048b06f4dfdeda0d5f50cafc3fecbddeb5ef0672ee9a62c8e27a909a020e48df8c11ed6120f0586e21a7952ff3'
            '0ca3013cb5021fb7915d6732ebc06569b014e42e0e3615726254322c30ca44488c903f303d5380aba4ae0a8adf5448ec3b1d0933dfbce295687467dee9bdd2ca'
            '16835ee59a27ebcfa8803038de54551434f04775dfb3f4e278679c64adc293774433aa23b041560fc8c030ddb397a23d32ffa8acd5d040ee613491627dac7cc9'
            'cf1a2751715cb7b94a69964ae586dd3f184358e5eb4509646991dfefd932c111516f77d5d7723e0fcdf4b1f1901f3c83327f300d69bd49295f74f9ef0dc31889'
            'b8e69cf3b77547877bc910dc8825709e6e091c760271a55f24ab35e4f6020828d6dac5fc42eaa22be3d84796df4bac0d94d690f224cd137ea00089193ce56e49'
            'eddabd5c2ae1335de843fad0b4c2f5a224d920551c97377d7a96c814060ca93207f294a9bbfb5fc03c9a48bce8e5a296fa542645f6cb79df00db90db573dd674'
            'f2cbce68de5eea730271269ef9e4b5c8bbd918bcc8b4e9c48ec5c9f8c1852c3bb0126ec7ad34f9225d7f0496a0753fbb60b55585d099f62a6d4dceaf3d3ce312'
            '6eb28259abb36d4acacedbbbb8ae8871cd7a275f7fe15802403e1bdb5b890654724c2177546b15cc9778bc112fde2aa78e630ac136d404e077438268691106e9'
            'dee7ba77c1a52a11e8d2ffd576fd23e3347434a1d52bd0f7ddaebf1fe81620064100b906510e3121ed2fcbcf997e99c4d247b5b56055b93e6b366c1359ef9b64')
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
