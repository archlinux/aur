# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin' 'ceph-mgr-bin')
pkgver=18.2.0
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
sha512sums=('037cd48b0ec1baac40862a6b3f43d72096b678524faad1018e164d34cb524f736cb190b224e3d4c4a9d4499e483e8214efc245559201504df6e5c2b4c53ccec0'
            '07996a55fdcdcc342c5b0e3b48490671ff03efba87f64292eaff84534c70533178efa334bc3fb5bc3a3f1b035e385ba407a1dab349c6a7f8a7b0064f8902b7e3'
            '9a998d806e1999b1afaaf2c05534c2dea584cd041dd9b2f617cad92bcda6f0f94db06d823bc035f14ce788b3c80bb360aaab0d9ea335845bef90cde9a79a118e'
            '17a3fb9a2d1c406a93b2966b75f07e19d486a8e6f8aad16be1dbcd770d6bf7e29bb5c41ea9edf8a8a475367f38351b176279b77023f7708e8307ee23b01fd8f1'
            '23e083f7af24382d80d89936b9dcde8b5ab8304b64fd0f2f075586dc116ddb535c5c302d3ad086bb4158387b9adbf59b9b3bf3b330d2059a022c2aa6e0ed6b1d'
            'd841d8d54015750abaaad3162e60e78bb9721657bae694d902ffdf56499d8a40004b5fa82d260e7a77e691a7ba101a5b3f13ed52231faa5428858c6cb6c62e1d'
            '0a4a71c23d8c07d3b725cb4c7a507419ccc3b5517d8952502a9c61f8a8ec85d5395a120570aa45c1961cdbbe9dd75b7855e9a561557b04c5103a23b6024903c9'
            '666e7c9e23f4ca2504b77e3b8d03c9e1eee6d363fc3b0ec59003815ebc5489abfe64c7959ade602a8f5d18ede471efdeedb7da87b74eb1137de6c5298d20ec61'
            'd31334535c53004b40c81b3c23ef238c057c8718ea57089d3be4a6549a649b5f031fdd3faa3edfb7175cd33750e561804da9043f061df597477a29dbce299940'
            '63e3a3f61ed44e897262364d207dc826312ba36e2b91494b83e94062016a6a2585cb7e0866d92cb5ad4de86b4226a483e56b96d1d31e781cf7692573a140a58e'
            'd79e9945f084c564cb0e9bcca8fb081b53ee10d2f91b19bab0df78c935d6684051e49b37bc8f13a3031ded1fcfa6dda69d303327b84fa541192c331d2e96a610'
            'fd19ac1adb0ff83269b81878f6e799f84ba866e2398ad4d8c107feaa50cdfe5167b1fdb332c6d1868f20f42b56b67c228b54cb88352e692238d78b2285570a12'
            '63a3cf87ddfca6824123f45cb8dba04f6f6987364b7584109b1898a38776b65d1e9637c31b0314b7d6f5234fb5b88751d2d01aa86f05850c116f5f97a55a6525'
            'b9d48be542641b6121799e5c8cdf8fdfe91467d0c135183193e2ca1e4477406212850d4d7322e14218b75e87479e31e2823f9f3a9952ab189f52a3a3665a288b'
            'fb899cadee93ced91d6176cddf0711270117189317d5bf07982f2ad0fe91f7d06c8d2095521bf3f295baf7ed8464d76fc92265b9c5a84783815a6981a4d35f0b'
            '57c7e111a9396a1e27ee0f635e5a313895543dd7cf22a5de6c770a1844fb0f970cd36f654fabebc92db7f48df8ca7037acb502abfe1f78dff7e58e8ade1e4512'
            '7545638c100f86e4794379b73406b8fbb58c03d88e6fa6048df3afba0f35f0d86425e44a9b0e2156e81fb58f22b4704f9c7596385932db0e4f83123ae40f7ebe'
            'bbac532df4846bee36efb29d827b63eacfd19c75eac9f673f16851e7d34fd7a94b1b5aeb4952f5f3d43acfc3d4c380d7aebc6cf390d43d7f1413d960bfefefa8'
            'f7cfcdad7347d0b020529297b3e6a265ee2896770d067dca41121f44606ad04e0b678dd95ebccb864177350c21194660203fa85bd6b10a5abb3091d028ed4352'
            'fd67aa3701d89b368c1307db76c7d9dafb420adde6c88585b08d700e34848e603ef3fde772b22f8ca162e583138b0d168a04d4d6e2392afc3ad863d4bd519cd2'
            '6af7a1eef3c858fd47be6007b87772f997c0042b187fe70e041543699abbee91980958d9f2e75d2e95688b79fea2863010513a7c0cdba4d3139c8f2c0849592c'
            '80ea2256b5a1eb7b02c2441628d7044eacaf24f0e530571fc3a4aab36af96e53b53d24d4b8d2df901eb9a278a65cc137575ff633e4f1223077d7d0536a73ae4b'
            '073fdf5668b70b51c3a05671db2b7dad3b0103da310d5fde28d076db938a9dfb4083d312d9f9efb34041be9ec9d388f6256f8c1e614fda11e4d7fe2e958f4905'
            'c74672f3cc1cddac7f49c6dca726be1abe4e8509b6c6a5bdc661d21d6e0f75b1583926dc22afd766061cb4e244b8caaf8155c81313af2246c1619fdf6d952662'
            '5a8bc7b957c41fa45337723795147594353dd92cb21792f5477ed8d922f7dfe06ab150e51c6927de6e8f6a4f8b4392023ee02066141ccb9a8104864d7203606e'
            'b3856b21d716d1074faf33dcfb819695564b898881ef2b1f8d1bcaac4965518fd2abdc2b3b1b99f71748a1537a14fa869dd0fcdbca89a71d11e8d1c3c355312c'
            '99ddb93aa124c1bcee9ba6eac8284e37d8fef6554a54e74028111295fc7ac56a47a2864c1f1290dea342f9a422b6ee41bb4e8b62fc52449824462559293fdc40'
            '36328e39ca4dc846cce72d9473c8731464b4d6f85ca1f5bace80c1adc8da5536334d66e5610dff16a8dbb0aebd59efe5ca57217c7bbbdd1ab57d6992c44034cd')
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

package_ceph-mgr-bin() {
  depends=(
    "ceph-bin>=18.2.0"
  )
  conflicts=('ceph-mgr')
}

# vim:set ts=2 sw=2 et:
