# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=20.2.5
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
  ceph_{rados,base,mon,mgr,osd,mds,rbd,cephfs,rgw,node_{proxy,exporter}}
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
sha512sums=('254d17942b7666ca133ac70ad4ee33ee6edd4a331c6cbb51d67c1b19996e9436bf9ca0c76f9a7902a0a314e5defcb6bd6501d8cbe87df6876c70a705d4748cd4'
            '9dcc1d62740c6779fb0fed80f19d3ce8605bda1566207f478b25f0736f08132e8b15287688c32db3982293c6fa08e5cecd06aff453437afa2688b042b644a4f1'
            '8bc5820c300540727068982de49ea6ad63706a2b9b32722be0210c4b57656085a32956b0b2a3103984d38c8c8244002ddd08d3b07205ad7e97da74bbd2f9d10a'
            '71665edcb623a57bf3c0e436321fbaa8b7ee2a1af9adbfd223ba29d1023dc01cab8bbfb4ea03dd23aa9ccea66858316c332a690d52a3328aa14ba85d091d2581'
            '968fce2c74dfbe0f1d35150fdcb852d4c5e0823046e5ae74ac3cb1e5cecce393a589a336a514834eb2691ea9ed39b98a4c86b89310f2bd725986ac71d1d932f4'
            'f9910e36273d7f68c9e25699dc4af3d4efd6d86d6d57591a98f8edbba4258923b5f434c57ddd44dc6251b9f42a94eda6523853fc87b10ff04bf36effaa9678a2'
            '963869604d40ba22326e0e07f73dee88c3c1131dd8db385fb0c1ba419500c682edd7ac9ab44f3639306085faa3deba500e37c8cbdb869badfb88f7f80e6cb1a4'
            'fbe28446e890f1062fcdbca325c254c7d976b751aec37ccc8ac27186a7bccd1d127945bc087a89f94a2817bf154ce956298b28b3431d0166d3de30b93cf0a786'
            '90b1c102e4218388916de4296d5922c1629d6b57d4a70c399848842d85b127c502cd428d7389edf9a5ee97276f9c8b22806b34935f0f11735ab6aaae011d519f'
            '82ce823cbfd6c098e956532dc67273e23ad1b54fb4285a8f67c87f108f486b454106cd912e664f55b2d5b72678c63c95cff98f81ce433b21f75f5c483153e1d2'
            'b23e85b89357417512a21318e6c8a73999780e95b8ea3ad8b4004a9d75d525d3db7758fe9db31964179e69aad14ce8024afc8146aae4a994f26363c6e38982c0'
            '1d03b403c42c4d32d203a16bd116145c180b415d3b2b1a4be9eaa55023c56061d6446c97a4ac8ceba1fe475aa485c3a8c0ffb03823a9e868a9e9fdb81e32b00e'
            'fb12e9343ac9a285d27219222d0f406a48b99f30759fd603533645effa0ccd8fef4acb4eb6d750cce951fc990716d880f15eb28fde2f87c7ad38f0e6714bda78'
            '774d21a4a48b8838ba0fc13c5baafe610016b04050f93d6cbb2453f4fdf694fd7b39053daf49ed62e4cf97f94625ed4d03762c80e3d73b09bc74826b7f345620'
            'be75039f69e446cca3b7758a68d63f57cbd7edba368f69edc3bd413d4eda4e2847f2825abdf746bf4036d04d90c68480b89c47dd88e4b2a13b429dfba3c2a910'
            'f5a848388200422c7e88c2744253ddf670a20a1179dd4186169ae8570224f3e38ceb708ff728097eb4bf2b8f6a01b9b1a0bde4f5ddc68f2f37d2c8f3a482e533'
            '43b3ff2bcc8440f3926db84a17c78d3aae22a03fc8c812d9b66827ee9f7edf839c1a3fda9ad8a030c1a42cd7c3c3e5e96b3d0ce932db1d592796a94f8bd1cc19'
            '9b4ceafef4ccd43b568351d2afb1965df6beade8f39a84aafea45e5da7e1739e13ec0e163e68015ddd9cf78a867e8007d7a20f3603cee8c2a91fd43a3a6a7b1a'
            '087072e4978037cff56c55c920151c6423246e64cf6961553f8f0f7a8399e0dd6a43bcaf01c970750b8d35828868d1396fe96bbc4f03b8bb793fb512cab0dde8'
            '9390d904d2985458312ff7fb2cb0c22be2185bfecb49a18fa47228651b6158cfd98372b0c7de75e7c7bf04747b7348efa50088c2e8d60fb1a092abf12616ad5b'
            '99b978034d2297d06141d2d2fe5afe655930fb8fbd93f6438093deb504de5bb6405c034b8823d36d4b444301ffbe2989a011795bf2fa0abf6d8c0cfee71bcc58'
            'ac419561369e2d378097e96e254077b5ff04a2db1e4b9f173a715cf585b6b576f8077fc59d383bc2051acf1a4a2b4a3d6e7f95feb9a31475b8fe2983352436fa'
            'cde5f35f276998ff3c009d8e38927fecab555fc4701fb3b1b60260160a57d6c6bbcfc43a69505fe9572b664bf78d94b4993c31f1f6cbc3d9f0b9bfc9ec2bd85b'
            'f4c453a6df84162c2ba151cc2ab985666b60c1e338a664f4fe0b2f433c743bb049b643b983ad80474119d6e755e81b978303365ffb16aab5a2f4a0a636e44de8'
            'e3bc6c716d9a15e8f4c869a3686400fb1953f90313d1148c5c56da082ebe50af87e2286b339b4b8072211951b1dc666db358a2e14c9a3f673857c95dfd69279c'
            '4afef27575c8a38c834608f97079870b3b45b44faa488fe14ed65be5ed2cf0afa0fa77c2ed8c01907587a650a3f29efc86d3f041e4f7167994340e6989264de7'
            '69390fb84ddc6243677c7f90b0f468968b75db227ebb6368d86205687921bac3b7a874833e558d759f7852e9d3993e25627156a5dd3dd300497dc80cae99039d'
            '4602d913a8c772399b53a61a8c6ddb020c9a3b4fb0a337f755ed8890ff84a4f8ad00c296da7640aada3b721835fd3d2f6f052f4d95338070093c96d401f4ab74'
            '0206ee6bd1738800e17d8fdd4a71478d6c254e60cd3af9a817560ee4bd79c84e0ebf896624c84383113561cb9f93fa0d37a524ef0d10780e551940950c7f1c78'
            '4cedd3abdb811d04e5fca62cca95bde8919fc667d0b5c85febba8440ff6ae565b77dcb4c78dac257b394f226ab4b6354ccd6949d7f855173f18a2aba9b28bbd0')
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
