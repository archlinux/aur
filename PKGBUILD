# Contributor: Luca Cesari < luca AT cesari DOT me>
_gemname=tmuxinator
pkgname=tmuxinator
pkgver=0.6.11
pkgrel=1
pkgdesc="Manage complex tmux sessions easily"
arch=(any)
url="https://github.com/aziz/tmuxinator"
license=(MIT)
depends=(ruby ruby-erubis ruby-activesupport ruby-thor)
makedepends=(rubygems)
source=(http://rubygems.org/downloads/tmuxinator-$pkgver.gem)
noextract=(tmuxinator-$pkgver.gem)
md5sums=('4b991eba37c96fa452b43150f7667a97')

package() {
    cd $srcdir
    export HOME='/tmp'
    local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
    install -d -m 755 ${pkgdir}/usr/bin
    gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n ${pkgdir}/usr/bin ${_gemname}-${pkgver}.gem
}

# vim:set ts=2 sw=2 :
