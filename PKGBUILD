# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-opengl-glut
pkgver=0.72
pkgrel=1
pkgdesc='Perl bindings to GLUT/FreeGLUT GUI toolkit'
arch=('i686' 'x86_64')
url='https://metacpan.org/dist/OpenGL-GLUT'
license=('PerlArtistic' 'GPL')
depends=('perl-opengl')
source=(https://cpan.metacpan.org/authors/id/E/ET/ETJ/OpenGL-GLUT-$pkgver.tar.gz)
options=(!emptydirs)
md5sums=('d1168493a56c31ad878d257e1eba3693')

build() {
  cd OpenGL-GLUT-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd OpenGL-GLUT-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd OpenGL-GLUT-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}