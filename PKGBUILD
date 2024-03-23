# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=18.2.2
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
sha512sums=('b38737ab59ae5650dc9f5c23adad7632cfc91b968e210c4dad5208f10579ead23efa5fe091f1e50e91591b283e9341cc7392b286393d140c8ba5b6be796a6264'
            '01af9965186b285101287fa20ac15cb37b168d9367f4c534910b574ef0e2929a4c6775a1f4b9aeb148e72c552907a220cb8e1e75952aa4132c8e5059d0b7a129'
            '9b68752a6b6b24aed7eb051b678cb5f8659442507686c87583d588ed13ebd2076488b2f5aa64897ee332e6572902e4c6f5cd11e51ce4b5c632b4f86897c5805c'
            '659f5f9dbfb3d484b5e8d0a4ec912d6fdad8d976fb70180a2432ec2fdfabafa73a7f6f65cee5087c744228ec707ba6afda9b7555479524744e0f5720b402a6fe'
            '74140baba7c0f9184b933fda3738a343e8bce5ef5b577f01d0ca0d71edd80bacec623bf534db6fe0ae9fcfd19409c1282b1e55abf44ef4065cdfa06d69d0ad26'
            '2fcc1283b7a9579614512b4b91a52bcd8f20c11af9b61c72b45454b95ca5b142f5a86157513c6b9737f17c4f46fdf40069e87df8075ba4fb98063400fdf2a5f6'
            'efee088d6b689599554368db9dfd2134528a946d3399f86575cfb310e5ec4d19e72cf42458cc5ef59b153cef1e7cc921f867286c70fbe924d6c8d494a13bc1a7'
            '3518f8c12fa62222ffa9b17bea5b346eb60ef234c784b8ff1611737243467ef0dce4762963b9efdb5a8c0cfd67206946940b730b139c5d77db907adfb074e0f5'
            '8648371159c7630c6ccd504274659579856849a3514f0e0583b7391f1f370d953e7f462e4b5c4f867d3aa5812e2cc9e3433a7b0a216ee60c0dad92d7e637c41a'
            '20253aff98a0361d9396d821c96872a6d94d7302ab4541774177787c5879aa925aaa6d42b2c44bb6a79b68d9dc47c82c2787ac4921a474c758ae7f77fe893819'
            'c5f8608c25d83ed274be210edfafe97a420c93f01428138721fcab2bddefc22549d5e838d81afffa8bf91247b63dfc2ef0481d8e4ddbfd5a889070a4b92baa76'
            'c46319a5069fc25f56041700cc649fc98f19cf864506ab23872d046584b29054fe811056d164c00f899c1752b143dd78a79a9e96f3a78410f21c13d135c57d79'
            'c960ae97cb66596f32c86237685714072edcaa6ec55d24392d3b046f8542ae7c0e18bfbd6d5bd9279c6a4c9404459ea680e3e2c1f5c3a5f4817d170f8b538ca9'
            'c79e8839e1bc9f177ff5e37e582da4279a417c021a52bfb2a85a1192f68f59690d2b0818aed884f2859c137ad7ab8c8bd051ad3e1451ac1ae3a6e41b23b477d7'
            'e487c0d31b25a9780845e80ccb4d5d8c84716730a54bdb00edf013c3a37c10cf576d83987949f158159baa599dd15805d3af2364ca82c1c4cc2023837aa08470'
            '1523061f5a5f0c199e42755e57176cb5abdf73849ce9602d672a40dec58e89421660c4da3c01bf057fd0d600958a3a7b172a94b9d590229f920942488c93f12d'
            '39c835954b4092626c9bede99e97d61fb9038698c977cbf644f5150e5f2e418af1b0f8a595fe528dde218564ed850bb9318f203dc18c4e5a701fa4a4ed0926db'
            'be6c8955c087d26b3f697fb87fe4d80342ef4012e8e0aa64382a628b448e24ea6f9f4f1c6c54befb3bba778c0998e6dc03e2702f0d554e447d53737ce5421189'
            'bc7b7f4fe7baec10007c321f955398cbc56b309ad043b244986e40f7a956d04765f2dd9df7b41755adbd6f13a7cde39b40a604d8add8222647da76ecbae34bc6'
            '6e7d6586b0e5545cec590c46aa0e9fdc329426fe52d41b560166860d2ef1617c5af41ee90db237a99de4a17af15ce3133fb93cb8386d14eedd5accc4c5d680f4'
            '093db1c53340d9bfc74ec518aeafc3e593ec381dbe8cc047615cd401b2e37f5a64034c81ff4ca3c008c17e86c8d3d317b3705f694f59ca20207a32cd7ab56a49'
            'b58c53d6fd644cb2c4656ea16838a2949b18085d2b45e62c55d2a59744eff49205da0173827f79ae9b1d5b2a123f9c83415ace9e835a9b3f79e07b009a31fe34'
            '8e0b76cc5b30caede9cabd50ee0253faedfe5255a75afcb4b794d28d21f2a41eb07da0947a9fb72fc29b4ebbfe8222844419f2003a91f016ac1c507ec3c61a9f'
            '6cdd247195a81f4c7366a2554511d4f0e6d325c3c6a043263d847bf6b5f9214ad8d42a31eac6658cd4d8a2e483c364662e335b37275f075fd5eb85e569fcd9ae'
            '097cf89e8c079297e78760fe5c4693552ad0228ad64ebfb6bc36b9fbcfa41abc572d12a8614a0e2d6b8afa2bdc7edb6638fa30e03b4c8868c77d1f9446b21b5b'
            '516a115e68bdb44177470a3e1364b21613fe670e90e937354c6bf5ff82c15b776f838bd2584bd7d94f8161c62e30a98b841cb151cbfa6ce3fcd5204b3761ae15'
            'aa1766f0c6d1d32724544fdf6077b1dac11eca066fe8b9621663dc925502ecaacfaf38b887b9a619394761f198ff66fd52aeff01e9949e0b72734ec2f6fb34d1'
            'c41b181654d6c31a9b876fda6166b4d08c83fbb2c55e48ce23152de52aca10cc4e593afa78e667a38fff8b091a17fd9746bf3d596134f9ff25c3589feeaac70a')
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

    'python-bcrypt'       'python-cheroot'             'python-cherrypy'             'python-cmd2'       'python-colorama'
    'python-coverage'     'python-dateutil'            'python-importlib-metadata'   'python-jinja'      'python-jsonpatch'
    'python-pecan'        'python-prettytable'         'python-pyopenssl'            'python-requests'   'python-scipy'
    'python-setuptools'   'python-typing_extensions'   'python-urllib3'              'python-werkzeug'   'python-yaml'
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
