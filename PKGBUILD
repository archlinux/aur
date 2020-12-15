# Maintainer: SaMaLerO <smlr[at]ukr[dot]net>
# Co-Maintainer: McModder <aur @ modder.pw>
# PLEASE do not mark it out-of date because "2.xx is released", *2.xx a separate project with same name from other dev team*
pkgname=tlauncher
pkgver=1.118.7
pkgrel=1
epoch=1
pkgdesc='TLauncher Legacy is freeware launcher of Minecraft.'
url='https://tlaun.ch'
arch=('any')
license=('GPLv3')
depends=('java-runtime>=8')
optdepends=('xorg-xrandr: Required for some old Minecraft versions')

_branch='aur'
# try to change repo if default sends 404
_repo='https://tlauncherrepo.com'
# _repo='https://u.tlauncher.ru'
_librepo='https://u.tlauncher.ru/repo/libraries'
# _librepo='https://tlauncherrepo.com/repo/libraries'
# _librepo='https://tlaun.ch/repo/libraries'
# _librepo='https://cdn.turikhay.ru/tlauncher/repo/libraries'

_bootstrap_checksum='4dda1474795f8723d4a98643d2e1e1da3b78f73f601d125c0002306b6c8c2c2e'
_launcher_checksum='d997526b29b5d4cc83b4c4736cb49a73dd69dd2591a0246f02f5e51972070442'

source=("tl-bootstrap-${pkgver}.jar::${_repo}/${_branch}/bootstrap/${_bootstrap_checksum}.jar"
        "tl-launcher-${pkgver}.jar::${_repo}/${_branch}/launcher/${_launcher_checksum}.jar"

        "${_librepo}/org/jdom/jdom/2.0.2/jdom-2.0.2.jar"
        "${_librepo}/org/tukaani/xz/1.5/xz-1.5.jar"
        "${_librepo}/org/apache/commons/commons-lang3/3.4/commons-lang3-3.4.jar"
        "${_librepo}/org/apache/commons/commons-compress/1.10/commons-compress-1.10.jar"
        "${_librepo}/net/sf/jopt-simple/jopt-simple/4.9/jopt-simple-4.9.jar"
        "${_librepo}/commons-io/commons-io/2.5/commons-io-2.5.jar"
        "${_librepo}/com/google/code/gson/gson/2.6.2/gson-2.6.2.jar"
        "${_librepo}/com/github/zafarkhaja/java-semver/0.9.0/java-semver-0.9.0.jar"
        "${_librepo}/com/fasterxml/jackson/core/jackson-core/2.12.0/jackson-core-2.12.0.jar"
        "${_librepo}/org/slf4j/slf4j-api/1.7.24/slf4j-api-1.7.24.jar"
        "${_librepo}/io/sentry/sentry/1.7.30/sentry-1.7.30.jar"
        "${_librepo}/com/mojang/authlib/1.5.24/authlib-1.5.24.jar"
        "${_librepo}/com/google/guava/guava/14.0/guava-14.0.jar"
        "${_librepo}/org/apache/logging/log4j/log4j-api/2.14.0/log4j-api-2.14.0.jar"
        "${_librepo}/org/apache/logging/log4j/log4j-core/2.14.0/log4j-core-2.14.0.jar"
        "${_librepo}/ru/turikhay/app/nstweaker/1.0/nstweaker-1.0.jar"
        "${_librepo}/com/timgroup/java-statsd-client/3.1.0/java-statsd-client-3.1.0.jar"

        'tlauncher.install'
        'tlauncher.desktop'
        'tlauncher.bash')
noextract=("${source[@]##*/}" "tl-bootstrap-${pkgver}.jar" "tl-launcher-${pkgver}.jar")
sha256sums=("${_bootstrap_checksum}"
            "${_launcher_checksum}"

            '2bdf7a48fddc9259f5aa420eee328e939d71302a6a1b79a176e4fd47ee988b97'
            '86f30fa8775fa3a62cdb39d1ed78a6019164c1058864048d42cbee244e26e840'
            '734c8356420cc8e30c795d64fd1fcd5d44ea9d90342a2cc3262c5158fbc6d98b'
            '807c95293e41e8159477442077da6d0962a7f486d4b980be61f60a8db9cb290f'
            '26c5856e954b5f864db76f13b86919b59c6eecf9fd930b96baa8884626baf2f5'
            'a10418348d234968600ccb1d988efcbbd08716e1d96936ccc1880e7d22513474'
            'b8545ba775f641f8bba86027f06307152279fee89a46a4006df1bf2f874d4d9d'
            '2218c73b40f9af98b570d084420c1b4a81332297bd7fc27ddd552e903be8e93c'
            '8acab5ef6e4f332bbb331b3fcd24d716598770d13a47e7215aa5ee625d1fd9c9'
            'baf3c7fe15fefeaf9e5b000d94547379dc48370f22a8797e239c127e7d7756ec'
            'ede7def7507a24e74b501f80ba0cfb82eb5e5745cb493d3ee5720a385bfde1f1'
            '795f783dc6301d10e356d1f3db9952d71692ed8004ffdd843f0049f813a0d1a5'
            'c0127b076e3056f58294e4ae6c01a96599b8f58200345eb6f859192a2d9b2962'
            '9791ac85aa3cdad633e512192766f84995eddf4db188cc42facec52a0dae15e8'
            'f04ee9c0ac417471d9127b5880b96c3147249f20674a8dbb88e9949d855382a8'
            '6b4c15577b5256b64c7e3d69dcdbf8d18f17f68ac5928e36936bd6a40a91c218'
            'bbb82aadb5e4209527c15fcc40e514b6f4c921a37bc66b68b3611bec70c538e8'

            '4f601c6973d8d8259f1b9acc782a5f92ba5a040100b2ddf9766bbdaa6a8d8cdd'
            'bbb0eaa8d6714cc1e297d351f8e23acc25c08e4ddaf0bdcd0eb2c5a995c3561a'
            'ee533ebb5ba23496f38065622513cef21ad7f03e19bb68f6d2bae7bc5ca708f5')
install='tlauncher.install'

package() {
  install -Dm0644 "${srcdir}/tlauncher.desktop" "${pkgdir}/usr/share/applications/tlauncher.desktop"
  install -Dm0755 "${srcdir}/tlauncher.bash" "${pkgdir}/usr/bin/tlauncher"

  install -Dm0644 "${srcdir}/tl-bootstrap-${pkgver}.jar" "${pkgdir}/opt/tlauncher/bootstrap.jar"
  install -Dm0644 "${srcdir}/tl-launcher-${pkgver}.jar" "${pkgdir}/opt/tlauncher/launcher.jar"

  install -Dm0644 "${srcdir}/jdom-2.0.2.jar" "${pkgdir}/opt/tlauncher/lib/org/jdom/jdom/2.0.2/jdom-2.0.2.jar"
  install -Dm0644 "${srcdir}/xz-1.5.jar" "${pkgdir}/opt/tlauncher/lib/org/tukaani/xz/1.5/xz-1.5.jar"
  install -Dm0644 "${srcdir}/commons-lang3-3.4.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/commons/commons-lang3/3.4/commons-lang3-3.4.jar"
  install -Dm0644 "${srcdir}/commons-compress-1.10.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/commons/commons-compress/1.10/commons-compress-1.10.jar"
  install -Dm0644 "${srcdir}/jopt-simple-4.9.jar" "${pkgdir}/opt/tlauncher/lib/net/sf/jopt-simple/jopt-simple/4.9/jopt-simple-4.9.jar"
  install -Dm0644 "${srcdir}/commons-io-2.5.jar" "${pkgdir}/opt/tlauncher/lib/commons-io/commons-io/2.5/commons-io-2.5.jar"
  install -Dm0644 "${srcdir}/gson-2.6.2.jar" "${pkgdir}/opt/tlauncher/lib/com/google/code/gson/gson/2.6.2/gson-2.6.2.jar"
  install -Dm0644 "${srcdir}/java-semver-0.9.0.jar" "${pkgdir}/opt/tlauncher/lib/com/github/zafarkhaja/java-semver/0.9.0/java-semver-0.9.0.jar"
  install -Dm0644 "${srcdir}/jackson-core-2.12.0.jar" "${pkgdir}/opt/tlauncher/lib/com/fasterxml/jackson/core/jackson-core/2.12.0/jackson-core-2.12.0.jar"
  install -Dm0644 "${srcdir}/slf4j-api-1.7.24.jar" "${pkgdir}/opt/tlauncher/lib/org/slf4j/slf4j-api/1.7.24/slf4j-api-1.7.24.jar"
  install -Dm0644 "${srcdir}/sentry-1.7.30.jar" "${pkgdir}/opt/tlauncher/lib/io/sentry/sentry/1.7.30/sentry-1.7.30.jar"
  install -Dm0644 "${srcdir}/authlib-1.5.24.jar" "${pkgdir}/opt/tlauncher/lib/com/mojang/authlib/1.5.24/authlib-1.5.24.jar"
  install -Dm0644 "${srcdir}/guava-14.0.jar" "${pkgdir}/opt/tlauncher/lib/com/google/guava/guava/14.0/guava-14.0.jar"
  install -Dm0644 "${srcdir}/log4j-api-2.14.0.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/logging/log4j/log4j-api/2.14.0/log4j-api-2.14.0.jar"
  install -Dm0644 "${srcdir}/log4j-core-2.14.0.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/logging/log4j/log4j-core/2.14.0/log4j-core-2.14.0.jar"
  install -Dm0644 "${srcdir}/nstweaker-1.0.jar" "${pkgdir}/opt/tlauncher/lib/ru/turikhay/app/nstweaker/1.0/nstweaker-1.0.jar"
  install -Dm0644 "${srcdir}/java-statsd-client-3.1.0.jar" "${pkgdir}/opt/tlauncher/lib/com/timgroup/java-statsd-client/3.1.0/java-statsd-client-3.1.0.jar"
}
