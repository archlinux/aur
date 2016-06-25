pkgname=('moksha-modules-extra-git' 'moksha-module-alarm-git' 'moksha-module-calendar-git' 'moksha-module-engage-git' 'moksha-module-flame-git' 'moksha-module-forecasts-git' 'moksha-module-mail-git' 'moksha-module-news-git' 'moksha-module-penguins-git' 'moksha-module-photo-git' 'moksha-module-places-git' 'moksha-module-rain-git' 'moksha-module-screenshot-git' 'moksha-module-share-git' 'moksha-module-slideshow-git' 'moksha-module-snow-git' 'moksha-module-tclock-git' 'moksha-module-trash-git' 'moksha-module-winlist-ng-git' 'moksha-module-winselector-git')
pkgver=b9eacce
pkgrel=1
_pkgname=moksha-modules-extra
pkgdesc="Extra Moksha modules"
arch=('i686' 'x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('moksha')
makedepends=('moksha-module-emprint-git')
_module_list=(
  'alarm'
  'calendar'
  'engage'
  'flame'
  'forecasts'
  'mail'
  'news'
  'penguins'
  'photo'
  'places'
  'rain'
  'screenshot'
  'share'
  'slideshow'
  'snow'
  'tclock'
  'trash'
  'winlist-ng'
  'winselector'
)
source=("$_pkgname::git+https://github.com/JeffHoogland/moksha-modules-extra.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  for _module in ${_module_list[@]}; do
    cd "${srcdir}/${_pkgname}/${_module}"
    msg2 "Building $_module"
    chmod +x autogen.sh
    if [[ -f configure ]]; then
      chmod +x configure
    fi
    ./autogen.sh \
      --prefix=/usr
    make
  done
}

package_moksha-module-alarm-git() {
  pkgdesc="Moksha alarm module built from git sources"
  
  cd "${srcdir}/${_pkgname}/alarm"
  msg2 "Installing alarm"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-calendar-git() {
  pkgdesc="Moskha calendar module built from git sources"

  cd "${srcdir}/${_pkgname}/cpu"
  msg2 "Installing cpu"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-engage-git() {
  pkgdesc="Moksha engage module built from git sources"

  cd "${srcdir}/${_pkgname}/engage"
  msg2 "Installing engage"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-flame-git() {
  pkgdesc="Moksha flame module built from git sources"

  cd "${srcdir}/${_pkgname}/flame"
  msg2 "Installing flame"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-forecasts-git() {
  pkgdesc="Moksha forecasts module built from git sources"

  cd "${srcdir}/${_pkgname}/forecasts"
  msg2 "Installing forecasts"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-mail-git() {
  pkgdesc="Moksha mail module built from git sources"

  cd "${srcdir}/${_pkgname}/mail"
  msg2 "Installing mail"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-news-git() {
  pkgdesc="Moksha news module built from git sources"

  cd "${srcdir}/${_pkgname}/news"
  msg2 "Installing news"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-penguins-git() {
  pkgdesc="Moksha penguins module built from git sources"

  cd "${srcdir}/${_pkgname}/penguins"
  msg2 "Installing penguins"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-photo-git() {
  pkgdesc="Moksha photo module built from git sources"

  cd "${srcdir}/${_pkgname}/photo"
  msg2 "Installing photo"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-places-git() {
  pkgdesc="Moksha places module built from git sources"

  cd "${srcdir}/${_pkgname}/places"
  msg2 "Installing places"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-rain-git() {
  pkgdesc="Moksha rain module built from git sources"

  cd "${srcdir}/${_pkgname}/rain"
  msg2 "Installing rain"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/rain/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/rain/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/rain/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/rain/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/rain/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/rain/COPYING-PLAIN" || true
}

package_moksha-module-screenshot-git() {
  pkgdesc="Moksha screenshot module built from git sources"
  depends+=('moksha-module-emprint-git')

  cd "${srcdir}/${_pkgname}/screenshot"
  msg2 "Installing screenshot"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-share-git() {
  pkgdesc="Moksha share module built from git sources"
  depends+=('libbsd')

  cd "${srcdir}/${_pkgname}/share"
  msg2 "Installing share"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-slideshow-git() {
  pkgdesc="Moksha slideshow module built from git sources"

  cd "${srcdir}/${_pkgname}/slideshow"
  msg2 "Installing slideshow"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-module-snow-git() {
  pkgdesc="Moksha snow module built from git sources"

  cd "${srcdir}/${_pkgname}/snow"
  msg2 "Installing snow"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}


package_moksha-module-tclock-git() {
  pkgdesc="Moksha tclock module built from git sources"

  cd "${srcdir}/${_pkgname}/tclock"
  msg2 "Installing tclock"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}


package_moksha-module-trash-git() {
  pkgdesc="Moksha trash module built from git sources"

  cd "${srcdir}/${_pkgname}/trash"
  msg2 "Installing trash"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}


package_moksha-module-winlist-ng-git() {
  pkgdesc="Moksha winlist-ng module built from git sources"

  cd "${srcdir}/${_pkgname}/winlist-ng"
  msg2 "Installing winlist-ng"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}


package_moksha-module-winselector-git() {
  pkgdesc="Moksha winselect module package - built from git sources"

  cd "${srcdir}/${_pkgname}/winselector"
  msg2 "Installing winselector"
  make DESTDIR="${pkgdir}" install

#  install text files
  [[ -e ChangeLog ]] && install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname%-*}/ChangeLog" || true
  [[ -e NEWS ]] && install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname%-*}/NEWS" || true
  [[ -e README ]] && install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-*}/README" || true

#  install license files
  [[ -e AUTHORS ]] && install -Dm644 AUTHORS "${pkgdir}/usr/share/licenses/$pkgname/AUTHORS" || true
  [[ -e COPYING ]] && install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || true
  [[ -e COPYING-PLAIN ]] && install -Dm644 COPYING-PLAIN "${pkgdir}/usr/share/licenses/$pkgname/COPYING-PLAIN" || true
}

package_moksha-modules-extra-git() {
  depends=('moksha-module-alarm-git' 'moksha-module-calendar-git' 'moksha-module-cpu-git' 'moksha-module-deskshow-git' 'moksha-module-diskio-git' 'moksha-module-engage-git' 'moksha-module-flame-git' 'moksha-module-forecasts-git' 'moksha-module-mail-git' 'moksha-module-mem-git' 'moksha-module-net-git' 'moksha-module-news-git' 'moksha-module-penguins-git' 'moksha-module-photo-git' 'moksha-module-places-git' 'moksha-module-rain-git' 'moksha-module-screenshot-git' 'moksha-module-share-git' 'moksha-module-slideshow-git' 'moksha-module-snow-git' 'moksha-module-tclock-git' 'moksha-module-trash-git' 'moksha-module-winlist-ng-git' 'moksha-module-winselector-git')
  pkgdesc="Moksha modules meta-package"

  license=('GPL3')
}
