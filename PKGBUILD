# Contributor: Luca Cesari < luca AT cesari DOT me>
_gemname=xdg
pkgname=ruby-xdg
pkgver=2.2.5
pkgrel=1
pkgdesc="XDG provides a module for supporting the XDG Base Directory Standard"
arch=(any)
url="https://github.com/rubyworks/xdg"
license=('BSD')
depends=(ruby ruby-rdoc)
makedepends=(rubygems)
source=(http://rubygems.org/downloads/xdg-$pkgver.gem)
noextract=(xdg-$pkgver.gem)
md5sums=('19cb2211f1eaa59c8940cc37f2b950a0')

package() {
    cd $srcdir
    export HOME='/tmp'
    local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
    install -d -m 755 ${pkgdir}/usr/bin
    gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n ${pkgdir}/usr/bin ${_gemname}-${pkgver}.gem

    rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim:set ts=2 sw=2 :
