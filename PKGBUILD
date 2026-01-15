# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=19.2.3
pkgrel=5
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
sha512sums=('27dfe5b67938030165681a1868015dd32eaf63e8bd00f3510a24162fbf73e1029f7a19747a1ec2e51c562701409e887dff32084188e636edaf1347253ac37610'
            'b7fbe229b11af57b87cd4d8f55d1d5b8f49aa992aca1ac3662a7d8d9ee1ee74c879fa7f6b779ead66292219deddae0434d27acf9d77aa3e989f910c62c0fcd18'
            '361f3a5037e677d792d82f84305deba976fdfd328bdcf2ff843dbc7a4432da1ce3dace6a99a8350c8ee599d38ddbd23dc9d9d7850899493c916b0d2169951362'
            'e8db578ec9cb7ff96847de3c8fdd4943342a9a58bdd8f8b200c655f85c0a83ec732b69765ce6e6e0b6e066d7d464cbecd0cf42483f29f84332b59d9f67e0fb9d'
            '177bd7695235a4bea71b54b9e3feeb4fd82565e83b377ae36b20d56ffca248cc078483df4babf28d3c4ef318cee769eee8d2e7d12c09142bccf2175f42485a86'
            'cda83058fcf039b6e4da3e436fa2838871a28bb818a9e04b55d182f474e0f766037598ecc9229d79be594f3b0c356c46c5a7127f60212eec276315be93182c7a'
            '2d6f517cd358695f619ac7a92a9b9250c60b355f84b2961254d3776d5195152c99f4abcb72039898ebee2af48cb0f0729b3e765bccc4cc88be17eb22cca2bc21'
            '3b3cd7e6e40643e00f8d41111e6e8ecd59d03b0e07ea87e7d9cece07171af10fb774aa2f49fdae1d6af94f9b2ae1e5dec5b17dc2ead4551e1bef9849ec0471a7'
            'f98567e16c8a57e9772593670dc6ce41868645874fe515cccd056d26e9a745a394975af45e1b35d32c3342a20104f59a1037fdf4b03d38f6241f7a2420a55bb8'
            '3c974e01d0a1f59bfcf35ceddc26a5bbdcbb233f2bd73cb8f6808eb7aba6e1483b14f27cb6a8ab0d3424d13c5815e5da3c80bde8a3d4f225ef2b95f4543568df'
            '2fdf13f46c61a192de228efbf880276c79b28e92b23d105dc48f9181259b0c97038d7e7f0c9bb0bc86e837c12cc69d8d033bb6bda6a4ea2a3d5f65518cd4a88d'
            '5eb6f906831daaee68149517eec75ae4565a63a6d7bae855c11725177a5694788da04bf4e164062c1b3af550a1957e176a1b7f6e944fd55197a68825acd7ed2f'
            '19a467a2fc45f1f7b5beca433ba44d8bec7e897eaf43dd561e1a547c04fff026b64422e94ac655d3b89a6f9901604d0813a80783d70e43be5b7e411ca969f89d'
            '46c648423f5443e65d003d34d7b99b87cbc5f98f5188324e934cd715b7a409d514ce640da510d6dd3baab2c4eb3e97d311cc397a5bf854a4ac4bf6c15198698e'
            'ade21b7d499de92b338ec9d0d8a97f0a7f08cf0c74ebc5a052628c78a040ba7046fb562f2f5c8c8c397d175777abfe4521c15f951a5187775f249544d9de43c2'
            'a2a9fe121ff74d2b181c850c0da9f00df8139254354c8c87347b7cc08191ff4c494da53c22ce7866074e31c6d23fe49957e546b3e6f9dd26445e97601de4c726'
            '4bc08c2085a8b427f0f68ec2bff8b3ec0e9076619136204252bd91a8da7df688dc9f370735006e3dd49f3ec685223ce88f5c7f80991af8f60e31da3f888e1142'
            '92151606969904538076b0c86a0d0240f2c9c8f2d4c50f1d174a4d3ceda706b5536d84fa27c87a5cd3141e89b7bfeb834f01642b7a37ed8b676e557ad542ea22'
            'e1ef0a508a7b4a886927cf763dd48eeb5749e49c5031dba18f80e97bf020ada1c652410f3dbd33aea90360dd138f6b7c7dc6b613eb4c8b89d24149fa20be7d3e'
            'bc8a7917cca21c519567467e7c75960e4c9f1fe481f4faf0aa9ba8bc9a776ece19279e2cc546d251f1102d3bd671466889dd33f1e11e8b9394f964621138c728'
            '21dec79cb17a7f2058e465048b3026f301535c59ac6bd725cc6c653fcfc597b52aa916a613fde67d9ac7fe834f751a59110e7407d141862accdb3409bc6436be'
            '6438a124b8feb1e8095ae66ebb384971e8b017ade08e31476d813bcd4fa67a9ecdbf9fcd798cd978d71bb05eaeedcb00d1502fd06b961e7eb9c0b9f7f024e929'
            'f903e8942be57f5c6d89edd0471ab79f71b8a911f6690f7edb359701757056320c53c9860a94f75a41f37493e481a21376b4bd1d9dab9e1015a171c741544818'
            '1dd4853623e11856ccb51230869cc0695bc066564475068310e828b67159c630aed8af6afe15dae33aa8b70b02dcefb73738b380cdea86f867bd81c7dc9423b9'
            '63bf5ab50c0700618218514afc75e12f960414adfe6ac67587738be4f472a7c06edb4405528664fde29b3d76c58bba9418862ac0cf21659a2b6b5fd43844f0a9'
            '4300b4ecd4a8002ab46199182c6289b9ce55da8c175f71819c7cf98b07b317e25b3a65b2089748160afce3adb8e1418b5ccaf66bb4068818de7a2f9347e5abd4'
            '4ec46c9b58b9c2b41b38bce462759dfad6b5ba0538957b4388b9f05c2db1ff40fe137a6fdde9b2315e29a6cf9abf3fc855d08fdb56e561a48846ca96e11f82e7'
            '7e59e1f8eb7b1d63d58d487155ccc9ed94f4862b79316b7b6524055af63bed50b9a10497492ea48df88122e239d86e2c3ae8e5b9dfb01eace685b36c64e2ee9d'
            '05ab0f232271fb95adc5b97671958e4e7cc347f20d4c94ea5b7bf16270ddaef134b17abd243626d0fc6da24ce25325ca0a12c71f85720b919decaa5a06fd228c')
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
