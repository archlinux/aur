# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=19.2.3
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
sha512sums=('ede568b75b1f12fb316e53f0857b953b1d753dfc148167bf03e2ea1971e203a396377367529d260700b4a6d7a0cdc601b7e13e5dcf85f0bf6ebe0ba16998f9b4'
            'c0206728f56619745dbf0627fdfe0dbcbe67b585598f4f7765f70b2ffb3d9e5830b1e3adcdd15d7268cd507c03a634b6a8c0cf18ece238a03db715f53c6e07f2'
            '85c021e40226d680be93184347a36eea4dbf7c5c9167e011dd50ba12614e1305fb1d3843e5f66ddb446af727b578593223002f16dd087bc4561c8d87934dfe3a'
            '6a52148fa217ebb3d27aade98f629965231e1cf33823d8575ed968888b0877e88a988fa9cce314130ff6cadf5e9f0c9b743ca45c810001a36213319b79658887'
            'a66836299a504d9a81efb8f23490b2e8939ab96e72dbdd99cfc5fac97cc0a41737b8758b2e3560ed0d8c063d117baf6ff4e6b26df38d9ef8890f80f4ae249312'
            '025390dbed9efbf8bcb87426ae7842dda8570854bdb6c467846e1e35a25ac08b2ab4af1fb45afd1af5e8e9bd33c0e9edd37610cdb6af916ab04cebebbc08a193'
            '20bead85b808da95da8e495df029d3db31a095ae96753e01a0e9847dafb0b6b28799f13a32b59a0d6443a34dd4cb02a8092be84886157205d4ceaaa51f931240'
            '085a5196d8d6503a8f92d815d7593c0b9649029778a8c1cfdf4d3e9b047580b3208737b94f4bdd899d9a0f789b708882cdb6707725fc718ab91a56a4fe65e129'
            '9372789e67d52ec16d305101828aba228c2658bea6e64d1cfc3501af200736f8eec63984f95c343c6b458135fa78d3708022c1ee995b28625d694ea2557877d1'
            'a209429803be9165d844eeb923f77c740f920ee9faee5085f37553e963e89586341137d5fad75bef9caed5bdbc372a9ea7283ca6c7fa8adafe9fb567129a63cc'
            '247d5c870efbca865c5d29c7ecd8f24ccd6a6875eb9b086acf2c27cc2c20daf59e5ad11b93707dbfe341b6edac025c80bbf957036bb8bc17f4da8e517c90e04f'
            '19dd4f6ef07badc38006b6242b2809b0e2f32fa6c9f8c4e51c46abad694ab50a1e8bff34b0e6eb9fb2e8dc3be2d6d619add4b7e0b5d191199ced5e6c08112d43'
            'fcbbbf91a147fc98b486156788522fd87f25b8e60efe9f8e61a192c4dd05c0c1ef441c1e69cdb4071efafb83b20dda20229de1b40e6440625cccca9c62fdb799'
            '62f0584125b327e29bf8c08dfb22fb4a08c61be3501b40300794a7b8e2592178cc56501c06ec5c4fa77d7f1fe689c21255aeae9f1bebff4c8692af695afc5567'
            '432f535a0560677fc38c7e3cc4d7a276e2919470909e1ed21bcd5cb56c68c5539fda4761172855dc64c625795aa0308693c0f7a8ab6f13c4ba6b138257770652'
            '60242f23f5ae90d98915064169d007bf04ca48ab0a0cf0d1fe6dbbca902ab46f1a97fcb3aa928f3a7fad7afb8ca3602bce4bcee1a5eafad07231ce6fbad85b48'
            '8f5e4e9bf02775561028053b2df1a2f2e9ac31eb4991967b13b6117027e5dacc28deb5e3b9df04166afa762bf1a22b6fc1f8b76c9bc18f08df415e53074bbbd3'
            '03cbeec56666a3cdeef36e11ab502c88c6d6368aa59968222f4fd8f1481361d52776a03bbc969365ca32ea47a8b5b58e4d97197fb32169cbf99624035b051c1c'
            '0f4708a6098a630caa6e5e96ef8ba810e369bf304870d6dbfd8a1d6c41305fa5e8cff87c6d5a4a1cf82959f7a4573e7c7d140d7e10942218c12a9d41ae4a5f53'
            '3dd0e3734fa70d2a4baf1546630715237767ad0ec7b80b6d396ce48d5834bc689c6417da62e31bba18e1b9493bccfb42b5627a12117e99a9d3e0db0485196dd3'
            '26804c21ef29b6a28172cd98e7f612eed7de3b932c6c025d820327f95513c70d5a2f998da7c163b48687d88c1e793c168dd5358be89111f6a1352094ceb6d7db'
            'dcb1fe538c1c4be6c36a74f519be9e5619334b7956c390d9b4246f0d5f2d704e165a9831405a87d6a3805fdf502b23cfec6f9e008535da7503e5bef882364309'
            'ce91a5672ddbf3504470d8ba656640fb925218b121cf6a4c4f8fe198912e18cf36b614b404d85c229e151852e0f1f6da8ae2d476ddb19862cae7eb0538482552'
            'a9d0f5149737ff08c167b827444b02d581e8685af038ce09a82a801a09ec6341877892e63927d50891cab8e0ec90414d5c45407ab1baa6f1467dd0ef178152f4'
            'ed78a29b9c893f4fe68efc949a217ffa3310a9f432c940077edcd130b706270a8187c136492c6e6c4acc590ea0f3ad2e15a6be6e6d696dd4f2b1758f39e76df7'
            'fc2757fde7649c130e4479edac806b8ca9e5f6eb211d752732a3eaa882b099c1a1782bc2ae6db83bfce7998f447bb3044929dcca6b93ce6b07ed179bb225f879'
            'faeaedfd47be002b68772f9c6982ed11da7e0e2e12aaff5ef469c0c9ab0d4b092ddb3f3599687d3f4f71ea92d99a24f940198870a50c64d41c0a5ae523a6741b'
            'ec838c5afde08a5691dcb4d9e3878a577264ed368695c6868873fe504737085896811766c7aca1c7a15e9b05b3d12b67a823146b12c35b15d54df94bb352e7f7'
            'b503063fd77fa2c77a92d2c7573b6b2ad1b38395d66d0d56e3680495a7d354d0cb47133bc0362c427af283c0970a4f8afb0ea33a5b1a16992d54107c5eec2905')
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
