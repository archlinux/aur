# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: M0Rf30

pkgbase=eric-i18n
pkgver=20.6
pkgrel=1
pkgdesc="Language pack for the Eric IDE"
arch=('any')
makedepends=("eric>=${pkgver}")
depends=()
url="http://eric-ide.python-projects.org/index.html"
license=('GPL3')
depends=()
changelog=ChangeLog

_languages=('de             "German"'
            'en             "English"'
            'es             "Spanish"'
            'ru             "Russian"')

pkgname=()
source=()
_url="https://downloads.sourceforge.net/eric-ide"

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}

  pkgname+=(eric-i18n-${_locale,,})
  source+=("${_url}/eric6-i18n-${_locale}-$pkgver.tar.gz")

  eval "package_eric-i18n-${_locale,,}() {
    _package ${_locale}
  }"
done

_package() {
  pkgdesc="${1} language pack for Eric IDE"
  depends=("eric>=${pkgver}")

  install -Dm644 "eric6-$pkgver/eric/eric6/i18n/eric6_${1}.qm" \
                 "${pkgdir}/usr/share/qt/translations/eric6_${1}.qm"
}

sha512sums=('43e46a6bd82e201c8ee3221452762f6f2196ca56f932f3e632295c6859b0b11c674071c20a3ececa417c3195e85689d5019e986aad3dab6f98f79b85039f6344'
            'da89f7c90eb802969476b9c9fa811ba153aa5f9166b130637e834f3d36ad6572082fcd59d224117aa829f1c86ad755d7c8b4c16f6f01c97354b8c0cde1d5e2e4'
            '294dc989c1beb32eeabd510a5066df99fbeb47305fecda7c20e37bf887b24e258ae0cc768e935bf4ce95e15d80714338052976fd81ee72e05de446bfcab81dd0'
            'd2dd1c041d97569c30e21b132d481a90d4d4162addefcca0cc0a9264ea6f3e4eb64350f52a5618c0a6b6b876b57a7f5fe203bb385cd911722ea2dc50749ee713')
