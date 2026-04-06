# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=20.2.1
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
sha512sums=('8166b927830999f8a61b60971b9a75b79c47bd89dc2ecd2f2756a8d8f3541c9f980cb73b02adb4d7518fb4d688c8408f4cb0f8a8253a6dd8dc9159e7b5463c2e'
            '4dbab5cc4ac1b8e398183e31d47db98ca7ef6f8085490c062e276e3ed5f57895d2660bbe590a5268b9c86382044eb660874cb09902c833c1525d3e78e44f2f3a'
            'fd23427fcfbfc7aac92fd2bcee363ab8b4c65d572d99e50c7b3682e7038cf0882161033e488e4a55a7724b74a5b306e8af15b932247b1ad38271213fce54e418'
            '40159c2bb36fd9984bbda2b6e1ad7f52980dedfd555794006c4b218bc61e64acee8572ebd7a9877f97e8ef403954f44c0ffeb57dd1f66441746dd5e2af8a7e8e'
            '9dcc5d80809735540c56289f6899533073f8edc6fd63b50bd74275da8010543e7add025f82fa3e4004a471028044069000857ec5d354352b615779dc6602647d'
            'acae6833bf778fe425e53904d569e557cdaf48896268b3cef42cd3fdcc9bdd64d868814041bee95412bcc48b00fa676bae89ab59b808cebb85116623ed57f835'
            '5b198316016d2ed15c25cf9b24dfa2b70e168c94771a775243068e97416e17b59482100abd2a09c7d1f465e54854981dfc93c28b993c8acc3b6e6f50cfab2332'
            'dac808d78536d4c2703d6128521c4f7ac2e581f105436a1d41f76ce7eb9b34e27e346d1fec2f67ad6d18cf9e3780e40f96c48e3fef9c3095f5d0dd32b9913feb'
            'c4a389967f103eea206da015d69d1cd3e26aa13ed4434a631f8c047eab54f135cd110b57f399893bd209122bbf6ad0451582c446faf40e16dce3fd8c3738b367'
            '458bc5293cb6ad041b0efa07aa64c9c9ed7ac7b2b7e7b1578ca5b7cc78c6aea10956bd757d8842c3427f7f1f4aca3b74e804f20ffdbacacd5b6234fe0b5eab3f'
            'f44781f8d4390169b845e7d7149fd229f0b5396e92dfbe1645368d161063114fc823d87593be4a46d1e6dc8ca45452594c093b2f316ca5c4be4e74101dc689b5'
            'df25694d012c390f2aef54551ed9d66431afa8c29bbf4e0e6165ca8ec81815fc4e614918ea1b9a8730537286e4ccdde1767e306f9d4f3c35b8904e647e324281'
            'd4ba46031909fef744648ce6a1ff8b32a245a6d491245a102a54b3514b3f17a9be0fedd5a6c8f1786de17b01024c8fadcc99b7feb24e4f5b91c5ca05f76529ae'
            '94403bde08a6495200c15de36aff3c277752e52a7bb1dc30eead397f9eea3f8d09ad6cfe305ba62f8288c3f9097790552e9e50765947c523970be2f11a52aa94'
            'cfa5bf3cf4682b23deabe2ed7e1cbabedfe8cee3f0500c769fddccf4b2f948c943bfc43decd3a02ae0187bdb335eb793a3215e11d7c1b889298a60027bcaf3b4'
            '9c31ffbe55967405a5c73404fe62a403b745c0e13bf9733a8f5c9fb1563a54be407340d2acd7370868835535c2f2bd0a3144306a0223d4dc9d080e4c071c2711'
            'bff486b1a4e155512ffe2cf55a335439a4c1b5b274bfacef31202fcf9940a07b71205eded04a5cd089fe674c877383a655b53f792767f2beb6fc66f1d2a26778'
            '9443d80d048d1d439a83fd50a88babe0d824ae639bf40f9a370eac15f12fb8ee4e1df204bc56a48858758a1b6226c9ae0cdf01135be8134769ebc7ff0db8aa84'
            '53d68c516114da659bcebb39cf3196b74a614df7a0a1a0cb906ef8c9676d98be64f5815636e2888e68321b1e290fae7e9bd15bea35ddb80565e18ef014e1bbed'
            '5154ef3541feacc4a87ed5a43b149e4e8116523050d626c46d071e4a74e0184d9329793d15f7e1f869da3299548a7385a6c5e90c09d3403e90173520fe0609b1'
            'e5e004f538ca9ba29b4e104a16a0eff90d2e5c1d36ab44ff4ba3e2b152fdb4be616069506c1560dfeaf3d27f6c1c7efb859c226cca2fca54f2576c39ce8c7ec3'
            '108d5832d2823c4e329205fd23915e89334b2d2b6e7dd5ec56a1844701915d578cac4bfb8ba270d9ff74ab0c3ad8db40d6efe0bc098315f1e157627b3e2dba46'
            '4936461ad3905d8607a5152d93871fd66f6165356e95c6d09e511054990877258312a73452d6270dca4c96e48e5d6163ec00c2853b36afa6a22cdc9e32ff1e85'
            'd4f839f5fd14842bd959490fa326c754beb8395abe76473cbc39bc1b1f665e936b699b279c2d99cb636644b06f493cb5bbb257743db96e6c9595b7d35bb712f4'
            'fab5d0a29cc15d770d80f147d36232bc269b536f892a6b3196cd05e6547af05cd151815d526c5576b1eb1bd49079edfbc4baea166f3d58ae4739aead9b3324ee'
            '192e2fa51281319e430c2347077c6693d6a3437a16caa0fffc369e69021f244eddcfc42aa77930b68e4177c9b6d8410ecfc18587384910e07c96d8b6a4749f40'
            '29b43b72ae714064b3dcacbd6010bac898bedffe11c6e59beb9185fc5ca4d73381e1146cb1d18a52fa25d8527950169cbef25030b610d176ddcb5dbd4e6b81fe'
            '2f794d145b7b09c8ff6798cfb87a7892769cb5fe0365c3fa5c45ea9e2c56d66bcd3ea666cc6636b65c8bf421d7d726ab8ef9947d9dc854d55bc7c4cf38377412'
            '033d633bd47893c09d9cc95d953e2d40cec6fc70105b4ed5b600bfb9a9c31451c9586fede95fe13c326532e0e411eaec5cece360dc04f9a64b6f6e46c441a1cc')
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
