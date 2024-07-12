# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=18.2.2
pkgrel=4
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
sha512sums=('1c8b9629feba3764366f8e49e768c3a5d20d056c13112468e6dcf564cd661f703b6207cff395b2c40e2ee9975446f8314c5ae2559afeb198cfbb05796412293f'
            '4f40e7d383b8afe61aa20c1016630d7f814ec71b45fd191d894c9a053c3c8283278682d8a3c40f8100ac0f985b635943a957f2c6bdcc3edf764b2b783b24b733'
            '49b70065a662953315ea5eb21c91d28b1ac6b9fa55e3d2c675c26522619b0e29ba9dcc7360a91c9159a1458fcb37c85ead8dea14a25b4b9c95ac8f9d142084ae'
            'e1d04e44d298cd0635884f0453a03fbddd87a2e8be0b4a3a6e347c0893b32c723eb2921655e697033bf6ddec89579276d954a409a43be13432caba1a19707248'
            '090f4d549bd036956ca36f6ef735a122cd6f7debca3d6d4e61bdbaeffe3db31360c48f427d6ab1899e916bafe1fdffb093463c0b291ec1651e397ef141cdccd6'
            '782ffc31924493e0a70f8c957906566c258c94123bf81dc8547d1f8f1cf221e732f3ed6a43555ab9dadf6b31b5fe529ef1a476e72ebdae4befa7e330ae97f843'
            '9bf4da65a5d061d8b6b5d647de19fe5ac098bac1a516b9c20fffddfbf815703c4b0b7ada7d93ca0ffa341aa1b1b31bf0eedeba4b958752ed81c58f7c8c1bfb0c'
            'ec8fe24df940fc6af9544cc6349bbd03c050fd994020cd4fe5c0b1dc1297712c2f7a52d37988de02e841c64298b867b9a40659865ab3fc6a8039bb8fb5a7f88e'
            'ceb2cde47f1396f73d50e9ae0cdef21536630e35ec06d81c7aa3726e5df0ce3c3533edefd5915d2e693a90416bce64e9462c970c25426ba50e0263cfc54c8aa4'
            '801510ec5b8a39167506b3df83277145ef4cd57aeeae1d35844f375caf2e563eb24a1daf3e3eca9cf35c343eac14a0fa431ecbebd28608273dda8d459d5ed699'
            'eed39e852b1c95683f62c39c6c2cfbaffb3203e6024d5e656e4e19f82229266a27711af3bcd614e9f625f6d219d0124cd4fb6fb7b0ff087b19a6d751ba422bc5'
            'bea2c6545ff1d86b3b349f0d8b13cf4efbac07683ad0caee0c011985750ade2eb06704f9d32bf36b794c7be0a55008e8152d7133e5881c2b2d3b7856d3fc258f'
            '245be740ab13f6d65021dedee0e9449c2be366eb8942326624d5e42a0fb1b6cb30d1f417c80667e33bf91dca68201df2d42d66ee285d643910b99ea8f4932669'
            '45ab6fb81d98ebf33c92011ea47568f8d36586e64ac2912c779ed355b61d9421e1810e246685a74550aac50a298d298f262f497221e0e6659dccc54fe4307edb'
            '25e409d97c9ff202276f424947f2f45b9785102d9d26cc1a51b41efc055968c37bd168fbc5b056166c35c98939db6722c5778c8e49e6a2bda7a5aeb6d9709aa5'
            'a3b2437a38e3419491fceed32ee9c0a11f0abda98f9f2f72ebeddf665485f689a9e217e0686c7b93a852c76c48feaf2b09f1b32a619739cdf45aa947f27be2a2'
            'f21b3898e28aa1ada5ba1ca4a7491bb1191b2b3a67d113530b292b790210aea14b6fc23329b6f3445a64cf9019ab5535cda74c22b1c0a86e3eea73c295ea993d'
            '3027bcfedafdca39ea0ae16026dd99c781472c7e9ad945ac0ec01ad34c995eb516f4d097814979931a2404798b64ac8be2f260bc68eaf344b9e1f9e771a99599'
            '1dc0598b75cb638153914daa1cf4a3793ff529dfdc942c969e0da2f08a29d00a0f09e9215f4c4c603730afd43e953c465c86486f9c8cbfae16e180671ffd73a2'
            '36c1a454f82563397fcabf7b27a8b03904354a690e124146b4cfba621caf0c240adb8e0317593bfbc094691cbe48503504989f39135f149b9a4aed4a56f324ef'
            'e16ab78b15510a314949229c199a812d8dab9f4a3fb346a6c085bc60cfe7330b251b863944995aee0d0acdd93759e7ded80e275cda90ea6c95ff29346f29d27e'
            'cbb5e9433a6c92458991059c16ecee13eff964b2aea7996ce34a7a7d20ab93e7a6cb8e2841d63c8bb0cc941093e3d164b394431b5b0f999d2aa0e7f83e3aa44b'
            '28d06bcb28cab4e24d69824631bec0e3043f55e9a064307493b197f3c6d9891112ec9e60746c34b20d1baad6bce915f736c7900648f8e247b253bcf103107bb5'
            '044a023e871a85009df0ede3bd45413d8f7b6c8c67b752fe853cdc331caf92e5d6373d6871bb73c9cfd96d50037a22985c611bf8e4ec5c33cdab920ee8163179'
            '309ba86966e379ef7f4daada85292be2e8140a213a9880cb54e55c1d147853ba5dccfb07fb410b88e5b192c2cd7b2cc47b05d19e71e06cc2f18b337631b1d2d4'
            '3d1073e756d4bc68fd6bf9367442a107995908f8b3a0d67394d6ae95913b34c07c547b923752462ceb094eafe2da0926a135e3742d4e6d35d64ca9d5cd2accfa'
            'b7a6a6a9ef60d2018e6a49167e2ea0d3812fb9f13330c12a1a4e989ff11ba1655d1a0e9f4cdef01272acf0a514dc5b91d4adb61776bf77d05021ff3ec5f376d9'
            'af2ed8474cdc46352d1adb147445f33cda366e1d1d4e1623dc463b78db94fce44e9d08193e33caeb2a62bc2b9d5ffccaf7f8fedb33b515faec3fd754d5ccad2d')
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
