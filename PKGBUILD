# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=18.2.4
pkgrel=2
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
sha512sums=('d8f9fde30df871560a3678ed5c356d687e776d00ac6c2a95d4772e4bdacbc00f54d5fcd5fce7f489347b40fc097f032e385fa22ec69cabe21a18e362795b5c35'
            'd2446b75582596f4deae528f745b2e10445cdedd6afe3e97dee6e1deaebfa3ac79dde030a8821c491c9b434421351d6fa0688db77ca7edefa0d094b523382339'
            '7afd0e528d6821e09e37f481e00bd294c0db119ed26bcfd667f5b0566ff6793054b3a552ae4d7ef71f8bdce0e1cf6b174a7b850aa62bf042053b8dae64508f67'
            '326743d0329210f5091b44a54400be4f9cb76c120b292a05507597de602ef63d09fe055feac6b55c4b365187a5281b5202da8b50c0d95f71b418b566bf3928ec'
            '838df07bfd67bc545a1faf5684fe7da473d552a240b62e71f749a7e10720e799d18b37c13d9c8b47eb2c2ea176bbbbed9a9009ee08f1c71e1df7a9cec2f90380'
            'd634fcc755a78cb566c90e1a6735faf8421bf97948574edecbb4af0809847f9f8a1630ab15ffc2dfc5c9b07106e129b83e995695b0e3408a7af927d78456cd20'
            'f99dd358affbcca2d90fa6832a3512f02ce39a24ba49927ee58b3a3fc3674ec40e3bd2444bb0e15e43d438e88ee8ad4a10a855fec750ef6a1935c31d7316098f'
            'fb5742e3092c1d586cffe8ceac7b1bbea76e898966c98870229389ad4f49584b8bc66530c935730d9e84dd115645ffcc6bc82fdaf4ffe9a45dcc3e1e65a71387'
            '49047f1c6559ae14c1fc3f08addb24458fdece452f9fb81a408b64ea6614ba48134327ea58bc6f5c2dc447705ba7ba764b9f708d83cefbf072ffb60d662ef712'
            '5c62a69ced39530b4ad571ed8e2611ffed0788cdf31c328f726919a92a2d53685d62ef117e9f2211cd24db176e750b146281bdd49d4511ab1e6bd6c44a4d4d48'
            'd438e709199b84ec1771955d939bc3a2d1b271483ce513903a1c0ac0392fca3b08de431830f8fc1426028894c9b36672230eb4e77e9c7841c5ae7b5458e5d348'
            'f782a571d1cde3477b561a13d1295e7dfcca5199c2bfeb741bee24673e53c8da9e0f40ce6ab7fb74735f0a34600cd1525383e2a70ab338232eef4b42be739c9f'
            '46527e690e87c7486a47add34de2e10df24f50a4634597645f2f040a6c447ed1cb52744e6189e1f95c3a5cc8e347fa6ce1ec872b0504a68a7de2968df8adc491'
            '57b5bc9ac17dec5a6bbd3f918895725af73059bc93c80b3e379ca0ae65e660c75e6eca2531947fc73b63ebd847db59031862c15cffb4cb3b23a817b120ae2806'
            '4a7d9a0cd24de3f867679a6d95365beaeedff5f94325e6955ccdeb38ff8ad27b742c1856ddd1065bc2057ca614a8673af67c024032eee5add314445564883e37'
            '1c297628d600507c7cc046e2c88fded69743933794598e376ed20a870437096f1c67025d05007fce259f6f0085b575467b0f4c98bd5eeff057fa3c051add66f5'
            '2f6c66e0910932046baed11310c3f7f016af96ebafa37d04c6716eb9335f032edf245907f31981e787f74d9010d28871344ab52134bd505f2f53c170ff3bdcaf'
            '0b03c8fcc636f224b811aee157d42512fcc76e9312e13f8475e5c2a959b2997d207116321c48b37d43ee5eadd3a0863fc10ecb0bb0296951768adfac666bb300'
            'a7dd8f84829e4841968114b348c59b4738fbb4836f45e38e800c428b63d2cb27683ec7d0b0c9c3fd3d767d1b4d5c6c9c8ae7e37cb3368ad0a6426ba7893e3258'
            '3a5887e9048cc5ea3425926621f54a28e6daa0acf684e2b9f977c6046f2975b48f907db0616cb71684e384691b6884b00998866414bd7a063bd797b6f65771a7'
            '1c4247e6a1485887e793c373468b5d483c2f0dc8e3f05cc7f9fab6fbd1b9bd7d62a102a831216f27a8aceb74c9cf90d8e425f0b8d29995161922ba664eb3c2b6'
            '257c81b35250e3f78d4ddf4e7daa4dee229a26a5679c03a54c515195f6b4e3d62afe41d2edeeef9812b6bfb8b5ad033fb35b89d0dd001a3e16cb7a244a2250e7'
            '8da713c9f17143122a87c6aac0259fddd2a70bac646409dbbd76241845d00742d37173ad9ebb225ffa585291d9d4e3c1aad4317bd30144345da08e4e3abd4a65'
            'ca904efc45a8bb09642f7f5cffe11895d46c250edbaad48b8a3bbbc11ac5e24007558e128e855ac754fbcc60cd4ddd4160a7d8fdfb757c0480715ba1fbcc3e36'
            'ea33336c46776d95349b2d2b61933145da1493ad2c2b89a7daa120be5a1787719298c4d031a3f1d3dd18c5a61edf1cf2dbbcc5b30c1a478141d9faf80ebfb6a6'
            '3d20314e8fde868e15feab605a54c8c5c5efd60f385ef75bca9fa08efec8794a1a64989cfc2fad93f53905d8e253c46fe1b10dc0be5335121d5c0f7ce80daa64'
            'ffe9d704ec4ce7e22f96a770184b1f13f6364fb8de3832517cc90ce34edc5f12f41a9e61bf388d183ec4094b9f09200f2045f73101e8067d845f5129ef3480f9'
            '043fc1bfb6285dad78214a6a8ad3221342534a7bd1016daba790aae4ac4c4253e57ce2c502fd14b4b290c6de6449ad433df8dff3bc655a385fb71e3af1e1e3c1'
            '0323af7bc629278d9cdd0be24871d855fdfe6eb18472b7c6d70feb97f3ce14cacfd1165a6e32f2c5995a77b07be6b6d92e9749dc6cd368a83ab4fb1250dd032d')
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
