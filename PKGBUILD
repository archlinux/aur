# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

pkgbase=league-fonts
pkgname=($pkgbase $pkgbase-variable otf-$pkgbase ttf-$pkgbase)
pkgver=0
pkgrel=4
epoch=1
pkgdesc='A package depending on all the fonts from The League of Moveable Type'
arch=('any')
url='https://www.theleagueofmoveabletype.com'
license=('OFL')
# Some fonts are available only in TTF format
_ttf=('blackout'
      'goudy-bookletter-1911'
      'knewave'
      'league-mono'
      'league-script'
      'linden-hill'
      'orbitron'
      'ostrich-sans'
      'prociono'
      'sniglet'
      'sorts-mill-goudy')
# Some have OTF and TTF variants
_otf=('chunk'
      'fanwood'
      'junction'
      'league-gothic')
# Some also have VF variants
_var=('league-spartan'
      'raleway')

package_league-fonts() {
    depends=("${_var[@]/%/-font}" "${_otf[@]/#/otf-}" "${_ttf[@]/#/ttf-}")
}

package_league-fonts-variable() {
    depends=("${_var[@]/%/-font-variable}")
}

package_otf-league-fonts() {
    depends=("${_var[@]/#/otf-}" "${_otf[@]/#/otf-}")
}

package_ttf-league-fonts() {
    depends=("${_var[@]/#/ttf-}" "${_otf[@]/#/ttf-}" "${_ttf[@]/#/ttf-}")
}
