# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin' 'ceph-mgr-bin')
pkgver=18.2.0
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
sha512sums=('e34ba94c1859db66cb713c4ac941353deddba016149037106f5da7f5b8dbb0e888178c441bd5a1e1ac1bbdfafb581b5977110689d1e8166902605201a79e8287'
            '71f43d7a0408a34a1c55c008f7ae8a6f3f9353c08101f8d3cd2db4714e3cbe098618666d91ae4af9bbcf3e530ab82b16562c3af21008060b0f50e9b2b12d9398'
            'fc56d96f939870f275e3597335b5a50d91f5c7c37b3a30bf51cb57d16b86c722cefa14908c1c85b0219e121a4eafef601441dd9d74b9c69927520428422bbd94'
            'fc10f65cfc51e8d77897b597737ce4ed7d6b4ada32224d14c5a8296ea1f7fc04f8e63f02319148ce5a3da5f4c709483b58eecee6b950e0d4314b13ec9e33fb13'
            'f20c000585529876e6692367d4c824c0357680ac595d2528433fdd0f8789238c331ad12c9fc68ee32205760d8f7c3f378bad642ea125b7a0492282ff63ffab9a'
            '3fc3bdb0478630d6878762de31e813600acca8f22997af00d2c55da5c40b543a80b9cf3fced77f1e63f5ff8a7cffdd2ab155998932e0ac6af55344fe7fae43de'
            'e3ab2e30dfb9f67835e7f9e84b1708a4238c96f6c616c30862e5361c5346e866404912a7a0d6ceab864d8e431017a0f907936cdac7b50b940f3a3d3c08f3a856'
            '39d362908cbfb23c7009da372ff696921891452a3b9fcb555a2adf21e1c6a12d9100100f20256ed452854f36efd7d3121616f23db38bcff9064a1d5721c6c12c'
            'e1f819a01498327a2449a3653b04e1ac1772c820f3dbb16387325dd6b5477e2023685d70177a69b5fd9b43ce4f3059d68cd1a4ebb239423bcf2db060f5a88594'
            '5b83c13bc3168079a4e54f9f479a44d263a3c9c7b514a3da92a13ebe14ec78987d2974570ab094c8874cc18259dd701952e5022c21f0548f7c322894c667cc9c'
            'cc85397d56d6ae9f604562e65da97fb4bcc25dd21674a850677b46d101484f491727147bcbd5c77cd86585da31e4da7301aff90f1be3f876766db7de11fd0383'
            'c6a5ab06c9cac07133be53caef014d917f5b81b9f39d7e9d74424cf6198b04d5df3abd4bbbd6b5ab534129b46f3e5d82e78d0f3ec668b7b5b167e06b24e6ab65'
            '596fcdde0fb6c62a4c72f7f50e7be0f71267b87423e3dd16fbf6362926d656abdfe585edd0208adba0730b07a1e6d9cfde6696c45df692ee933814176355b4cb'
            'd4c09e4b249e2d0beecdbd59317b63d02562b50f0d88e3605ca34c8bb1f65f94b67cd5c931cb3d55ab775fcf2609d214d41479ea502530b7973ff51cc0e00a73'
            '4c93951cb41db0da0ea94c8fd5a7690a733d4fb17acfa275e2e8abeea820bf713568268a355ff1cd7d7c45c6bf4e7d60d707bbb6966b539140057a91a348cdf8'
            '14d397bda3560fb3c30b20e56ef990acb964417db4fc509a8c67df65aad18e7c74d2fa3aaedd5d66c3e4cd549cc9d2921f796274023d93cc625b76f75c1c8455'
            '8c34d6df33eedb3d3d2f82bc63c31aaadccb7838d1ee08343c87b0f15f27a80e02ad4a0699be4ca8039847bee2d7703edd612042c93631d7a5cc710b37e387ae'
            '2130a24e48acec85e5efcd011ddb8d26b5b4450733d6c3c45c0d65220dba94be468ea96dc0c71902b7a850069ecbc2da184352626bb8adbc95f74d1b68d65491'
            '0e9fd490893eab02aeedeb4dc04759c34aa023e2e403f46ea7e9d2d9859ac295e70c79e3fb96a00ff27bba3bac1649e7e96e58f21cfaad18f3c4c91fae615c1a'
            '88c2827341702dbb563b40d41966115cba8705c36c7d4cc870b80e2b9d023abfdb9422b07eda4c913ca1e17780c0be3395f7f8d4b2c5223156d50c9e607755e5'
            '66d8957d941af31fe8d23d59cc5a9e1862ed47e13d3b27e4f2e741dcacf5a4fd3c8ab8a906a844ec428fbc3338fb7b0e75c611df98ca0f7232e2f69d843a179c'
            '25ec3e341bbd5594c35493ba53f26b05541317677e322acb47c2ea3c6f1eac8d8099db6ff48554ad7855f01c72d3d3669b47977b4f86eff83b9bd4a7de5f558a'
            'a839024c2b407e11222b665ff78f918d63ae69df911f67c35e48d6a6159e4e52363e0365c0fe2e4c9c47c55f4d4ba9bfab1e649e42b0b215a6dba653a9b2502d'
            'e632bd8164caeb50e317ec986042d497de15046f85beaef630622ebf7f3bc848a18f2929ddea3c7bba1aa792c8ec922d4188cc61e56215419ff15bafaf9f423b'
            '1b342054de41d0f06b5f529446d67035f7e143c14a1ab30d1ae1c9bd73731da1cc0642258738d643768a4b94ddbaa7962fb22ae5802e9b752bc8630f4d5d98f4'
            '0aa69c04ca517c15c9a2912fe9b241080ce7fd2b87d397f65d785b0770ed5712140709fa5c7780a4591f568e084c4bd353d7db7646b418a43c70dbd1dd4c8c0e'
            '0f05a2fb7a20fbb01cde96d067a77ee6aa89c8072ececfc546bfe5a403a15280b5a41f740bd916737d18b81747249ef0473a7f07e6c07ad95e7d478150c22fef'
            '7d3f1ab01ef0eb0db38efeb024c0640887856da30e063b5f0870524eb498fb9e51e32003e5ec51e51351876fc970182b977b6ea8382d18566c84cf3a73ae45f6')
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

  printf ' |> %s\n' \
    "===== [ceph-mgr-bin] =====" \
    "This package is DEPRECATED and can be removed from your system." \
    "It will be removed from AUR in a future release." \
    "" \
    "Its functionality has been moved to: ceph-bin" \
    "" \
    "Please uninstall it at your earliest convenience via:" \
    "   pacman -Rs ceph-mgr-bin"
}

# vim:set ts=2 sw=2 et:
