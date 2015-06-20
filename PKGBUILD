 
# Maintainer: Vladimir Kopylov <vpkopylov at gmail.com>

 pkgname=pidgin-mrim-prpl
 _spkgname=mrim-prpl
 pkgver=0.1.28.1
 pkgrel=1
 pkgdesc="Mail.ru IM protocol support plugin for Pidgin"
 arch=('i686' 'x86_64')
 url="https://bitbucket.org/mrim-prpl-team/mrim-prpl"
 license=('GPLv2')
 depends=('libpurple>=2.4.1')
 provides=('mrim-prpl')
 source=(https://bitbucket.org/mrim-prpl-team/mrim-prpl/downloads/${_spkgname}-${pkgver}.tar.xz)
 sha1sums=('3428dbd8dc81227656a4bc2e2cbe344ddcb6baeb')
     
    build() {
      tar xfvJ ${_spkgname}-${pkgver}.tar.xz
     
      cd "$srcdir/${_spkgname}-${pkgver}"
     
      ./configure --gtk
     
      make
    }
     
    package() {
      cd "$srcdir/${_spkgname}-${pkgver}"
     
      make DESTDIR="${pkgdir}/" install
    }
