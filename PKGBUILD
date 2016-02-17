# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=thingspeak-git
_gitname=thingspeak
pkgver=r294.9d4b74d
pkgrel=1
pkgdesc='An open source “Internet of Things” application and API to store and retrieve data'
arch=('any')
url='https://thingspeak.com'
license=('GNU GPLv3+')
depends=('mariadb' 'xml2' 'libxslt' 'git' 'curl' 'ruby-bundler')
source=("git://github.com/greyltc/${_gitname}")
sha256sums=('SKIP')

PKGEXT='.pkg.tar'

pkgver() {
  cd ${srcdir}/$_gitname/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#  cd ${srcdir}/$_gitname/
#  patch -Np1 -i "${srcdir}/Gemfile.lock.patch"
#}

package() {
  cd ${srcdir}/$_gitname/
  #bundle install --path ${pkgdir}/usr/lib || true
  #cp config/database.yml.example config/database.yml
  mkdir ${pkgdir}/opt
  cp -a ${srcdir}/$_gitname/ ${pkgdir}/opt

  #mkdir -p "$pkgdir/etc/profile.d"
  #RUBY_VER=$(basename ${pkgdir}/usr/lib/ruby/*)
  #echo "export PATH=/usr/lib/ruby/${RUBY_VER}/bin:"'$PATH' > "$pkgdir/etc/profile.d/thingspeak.sh"
}
