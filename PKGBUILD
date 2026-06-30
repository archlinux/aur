# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=20.2.2
pkgrel=1
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
sha512sums=('8794ca94d2097aa74e21de53e33329a93fcf33e06576b0f3b751b6b0b08008521e614379733ab6c02e2e5f05a2db51befe772ad92c8b94441e49ee3f978a33c0'
            '5272e9a8a457512f6439b71cc373a77d181caa5979eb08e3f150d5c3547509fba09fe16c93b3157a4dcb02b0c827017eafa89b8005ca97d97bc7ce2d5cd7a50f'
            '735b87f7666eca991d4241369926dcea02086f0335c123df0cf35f3801c65d5de915d69162ba86e914e736416844f41eac4f3313af970e4ce1beaa885a9694bf'
            '86afe96509bae1c4fb3960e6a0a28f0188ca3bb754692f8897e18cfa6c6624083556eb0202f92409d8b64006bb6d5733a5cae2620b263c49504c58bfc36994e3'
            'beb57cc4d1e856fb1306710547e8a2fbfb08a021dd4314098cbdfa251ae55b6fdb2390c609c980ab8376cf691a70c8f03480214e300da2cc5009fe2faaa0edb7'
            '75a9954c7347b383f39f0fdb5c1b7b647b2c8345468988865f0ec85ff70b8b9a481d90e8bc37b755d459450f0eceb8c95bf701654f638969a25b8e6cb90d3cae'
            '25d3d5573b6247f1e4f10e8e406b6b16679cde6fd7fb4345ec09c2b6b9183c0bd1d1125679afd3e96b51fb30afba6be1c5f695bab1c336afc8b2eb1fa6734566'
            '993581a97fc9c0a31a4ba2f8b5c64a8896fadea49afa8342088aec2f114e16fc68c3bbdd67361b27acab91a45bcc4fe51159f06b4f9e79b499208915eaf43eb1'
            '36115e22c00b0e82d9d0ccbc2ddb7c0b7c431cf4dd3d7f7fe4c28ee004e909eee6aec84e33b601fff579ac5bfe77d504e19d138073cf503a7ced1420502a7284'
            '9649f2e1aa06cb8296b45d66425570ba9169ec2cf07d64132605675f5ee9f0b723622dc1a82f97e648cebdecec898ab8901d2b0002d504f455d75eb817d774bf'
            'f36e321134b5803ec159d000238867ea4e1ebcd05c21e52ce5db5a3bb7dbbd9b230d199767741cf6d5d242f6ccfabc8dfe1c3886c5a06c9d84bbd287fd1721d9'
            '4764172d82b860d9aac9ebf0c1dc06ff134a5b645b1ae8a1185fff00c74dd98e2bd6848c3cf5a09b134f696d756426c58ed222911cbe0a378531d8a760cd7f14'
            'edf83352c08164a92a88de7284a20c4514807e38b545b75008525a615a25a7d5b91e37040593b6b78f2be8fe358ae75f9c94636760b1a08c2257b671a77be597'
            'ff7c52e21d70025156214353865352a8fd379f9cdcb569e9dd96d3678ce716730ab03aa13b5855b76e68a434ae5440b7b796692490fdf2b55da4bc5152bc5001'
            'fe02b9c360669d5d3270303ad5c925ada2c12f5198402914d34c4f8a6ad06f61ae4762fe237b80308ef5c00f23ea23725a77af11c25149ba382558e7c39ab21b'
            '8b01e8f4c43e99ff5f5e5a30314fdebe5d2dd9a92a6b3f76e62f6b86acb5011259a412ced93058beb435585b31dbd794217a0d3e5e86c705e48352f9c1d6b8d8'
            '7246a83b88b72b7a056c20e44c735bd67a6783f61e73df9b7fe9738b093885cd61dbeb3b604316e9ab121e98b0b7c58206d0695c06f7f3f36e1df82f7c653a85'
            '10d38fe0a1c2ae6d32b56ac2f414330cc0e58d9b74f3c8ed26cb864935b5e1acfdda47439b7deb43ca0b7794c67aa72bce414b304fe9c00801253c66b71d7a99'
            '109c3f3416f9f380bec56b82c2a509702aae1aab25ce6fc62fced0f9403f961a7f44755c69b1486baeecce72e7a3ebe1ef0ba35241daddb7642e607bed4e5139'
            '2298b6a67a2eba8b981847bd5ecfe19b85d64436a2a3cda3f9f19031c9a496e3d0e7ed16b6e04e119781d17c545c0cdfa2eb4d8387074ceae000c8a1105f7539'
            'bbabad58078dd9c1fde45195aa670114048fe6dbe0f4238783d0ca045fd797867313b09b8a57069e4298688b48fc1c2682839ffa4f8cc5bc869f409eb350e2eb'
            'c6c3350d5538286918538326276659515a8dc0a26a54963bf4d3072e5706087501d7897949eecbcb9dd876a9ae39a5d2ac0363c8339536ad68ae1552cb2676e9'
            '2e76c7930500932597fb72c66601d2aa233e3630a7b6bc07addf0444b89b356c39f2ed071a3bef9030f4f01f225132c3b5640850e9162ee703c9ae92f7db4c53'
            '885950f1ab909058931676a178774600e652e85c2af56e1d1d03db35be527a68b44d38bb766c4303a85fe6501a64a73714758a6170724c1dea720c0cb4243386'
            'f0c23c7b8f9615e624cf5e69702036bdd77a01d5a8c5d3be526a4182a0a8243597bfa83408accb32011ea05b181b7ef720d23e1d1372899d53cf8874e9bedd92'
            '6a2557d13bf4cb70f573f81e7b8b669a1f12ef56d5b257aa15b2879be7870459df1c6c4affc76463f78ba4d7d960cf038a06bd8777403088e46cb2de46d47465'
            '18cbd4a37216bd244ef88e993c70887e694a1e9b56d94b4ef53a9e371d556a383fa7fcc982ce1a4dbafd4a4fa1b96e57bff6da7d2c26502514713fbb8aee357e'
            '166fe2298eec3cd334c6e2bf865355e56056b6a588d863ff974bfaace1c7ec4b148e5b7fb616e630b85002bb1871dd6747f3c3d1c02c90655815f643f43b5fc3'
            '429c4b9c3cd2ca5ec295e16f603d57d78d008e968964e6ac7193c795901324340d27f63f3a389a4d0959365947d9d03e4a3d4f389dfd217f226bb6738e6c52fb')
# Don't extract source archives
noextract=("${source[@]%%::*}")

package_ceph-libs-bin() {
  depends=(
    'bash'       'boost-libs'    'cryptsetup'          'curl'               'expat'
    'fmt'        'gcc-libs'      'glibc'               'gperftools'         'keyutils'
    'libaio'     'libcap'        'librabbitmq-c'       'librdkafka'         'libutil-linux'
    'libxcrypt'  'lua53'         'lz4'                 'nss'                'oath-toolkit'
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

    'python-bcrypt'      'python-cheroot'     'python-cherrypy'             'python-cmd2'                'python-colorama'
    'python-coverage'    'python-dateutil'    'python-importlib-metadata'   'python-jinja'               'python-jmespath'
    'python-jsonpatch'   'python-packaging'   'python-pecan'                'python-prettytable'         'python-pyopenssl'
    'python-requests'    'python-scipy'       'python-setuptools'           'python-typing_extensions'   'python-urllib3'
    'python-werkzeug'    'python-xmltodict'   'python-yaml'
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
