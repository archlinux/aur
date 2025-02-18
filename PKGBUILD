# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=19.2.1
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
sha512sums=('570d6c264c2b8fd830c89ca713f1e66820eb7a6ab87ef3b346f9f50c6d47e6ea1735f1aeb5c57b304e33e9877a81e8fa083e1400e1ac12d4b265f78d4eeaa189'
            '2ca685d330ef49c274de6476ae19a178c235789980cd7b93b49856299f96c1d177ab849d082fa0c1e95a81c742d807eda478b7f6e5283855db968ef685de2b32'
            '72fc006b5acb9ea97da10b5c5889bde4220dfbb9999104f410537d1848ca2070bea5472e2768af874eb27c665d564f1369f41253d79e3a22606aee712227fc5d'
            '0080c43faa792bc7740cfc160d6471479687bc24e077ef755eea5ac44b69e940f25eb7e777397cfb47c6ed0c0cea48bb226854075c78e6fd3066dc3113649d3f'
            '890d247fedf276d46a6aade50391005a6340d22ae864dddd1eb947c2076a1da533630c1b4bc893f537934714a45bfc846348ec5b960c0e18aef24054c65f529e'
            '476f29ccb3f0b70ed86544c62139975288d4fc6155fe764c66e1bfb1516cd332553b1ca016c88136282abdcf2e159a243049bb4d56d3fe0f37b34b4104e20057'
            '7615939f5d646e74a9beb9dba8f4b194e72f409880d4a1178552046ed7f4af819553abbc1507fe1412cc1697e987cfbf7d944cda4cfa486d15fcd1448d336b46'
            '204e27ec402e52ec0dc1dfa8945219041936dba0368771fa2994194f932ac3c38cb72c7182e092a0f7206a75435a229cad10c22f39fa1d59f10c74e716abda4c'
            '62aee1a98ff6283c55224f48646fb68b4bda61e579344204dda0e53fda7d90973524ef322e2235ebc481b7811335318ff1bf4d45400234dc9611c2507caa27f1'
            'ea16c227ca919bc9b1feea85cbdca6b8fe0e54e6faabed405046c27a7ce390cb74142cb63fd37a107620bb95a02e60381768115683660f353cb1221d56a6b9c7'
            'aad5dc902a434de410b611cbd66431635ebd26dcd6fcf57feb234cb89569f60303f4f6a3ab19b96eebd4df57d299adc659b1917bb1db09af1bd26a6b71c43a50'
            '916dbd7876c902ae653b057f5fe2716cae1821db03ebbb86a2b66968f21e36d68a1d5439f4a7d1aa7ce8b548f9ac928331794bd5343cf7c633cc18979b3be43f'
            '18bb4c60b31cb3a4a4a2e701388f56ae68f823ad163289e8f7bd7957052b81546e30536a754f63dff5a5a9619e3f5cf3834afa9983827e40b98787feeeae7791'
            '00938504f20b688ba5c3fc1a1f911a9b1aebe3851c88c51b2450cf725fc8488ca758b14ea3e5a9f5e8afeb7ec7fc1ab2e6d7ef85022be1b2d5da32ffff2e3cab'
            '4ac9387f1b1d5b7bfca093a3da6a6aca44a9f58c3e3839fdcb4185504f036b3c769c90493cbd135e4fb1175d88313f705b966455a966ca1fac7585447e2d8704'
            '6af5e8f4dea2e762c188f000d857788f28609dec39f3003a3d9e87f15637938705016f10264a82c96faa382f666c11a6c4687f5837e7263b374bbd3afae3d4f4'
            '7dab811b91b9a404a44e716cb8452b2eb87677d863ac0a2d0acb53acaf9b11f7635aaadcf5082dae7ceabef45ee251bbb5416d704cef0a469956b7f687405a15'
            '60b88d22c1dda35775d08ef495b0c1bdc51a4ebd6a4aee00d7be08b3c2c480361e37fa8ae42984d7240fb96a09618bf254d065201c8a3b147dcc3be308f947bd'
            'a885e26b268b64cc1b16bfa366ae0af447fdad58798cfabd49cae96827c5792a82a089ae79e012a50937bbbd42a1933e329f775b839986128c8c1029cf8bcef5'
            '807873375a9e711cb8fe5c256a4bd89772d31093fee5b35435aae9e38c5d762d0b8700e03d9b9ee9dce2d0ad1f9f156dff0b69e5352e8799a3b7b3b4d4a07184'
            'bac99ef34df1d3a6f7242eba67972facd01833b7d42a65caf86f9eb58b42285c0531dd7011c6c55c6cc2f57415b768da9e7772f85c9514764977f2aadd698b32'
            'e6fc7436ab5fa0500682ef613262027c5b26225a520435c0690c00b2cc89147a32ee729c8d5148a95102a5786a512f42922cf18092d73df73b0f61ccbd0627f7'
            'd3f1eb20e69b477f9c0b3bc0c73b3bbeec84e2e5feb3efb023bb589eaec2f945c145afc40fa241ff51aef1ad3c30d7e0939ee195277cf0d6343029470690345f'
            '7bced772153d2c44d4cf9e67531ca99d90d21bfe1c9e0f7f567ae6d8d934739804fb619bca897ca5324cfb7414eaf168f4da5e6d95755b3bfceaff8f038e03df'
            '260a7fcf7f98b47c2d17058fde05379de9f66402706631f810bc4e3ce514c477983b15d07db12131611b62e6d7d961920e152f5e1c8605fb771d04083f63d7e2'
            '1a0a973890c5f5f1c390c64c1949d6b5ef8d1233416f79474d4e6f6347f5d84a5265d067bd0baea6340fb8583aaaea522f51474a796f2517c03d461d37682a74'
            'afdfa8eccb5cfc5cfd70da5bd9c96dfecadb98ecd379656c989b5b17485f9cf1f620b68ed4a2aec0b537362ae9042d3e37206a84971912d7cd0b550dfc6d7d55'
            '07342823f466b41bc2be1710fc7165d4e6abb4ca9004ed3cbcecfdb68e0b02ddfde7f307b2facae09089bb0db157d412b763e2f473f4233976456a3ca39b380b'
            'bed02db69d08b19135822bb4b32762bb4133c210782437d3fb385ea23b8852e8976f0d9a192a60c624a6e1dcb8023bfb73aac0cd560c748fc42a15be123a1e91')
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
