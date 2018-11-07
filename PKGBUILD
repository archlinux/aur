#Maintainer  : Benoit LANDRIEU
#Contributor : Thomas LEGRAND
#Contributor : Alexis Bienvenue
#Contributor : fabmen

pkgbase='auto-multiple-choice'
pkgname='auto-multiple-choice'
pkgver='1.4.0~rc1'
pkgrel='1'
pkgdesc="AMC est un ensemble d'utilitaires permettant de créer, gérer et corriger automatiquement des questionnaires à choix multiples (QCM)"
arch=('i686' 'x86_64')
url='http://auto-multiple-choice.net/'
license=('GPL')

depends=('perl' 'perl-glib-object-introspection'
 'perl-locale-gettext' 'perl-xml-writer' 'perl-xml-simple'
 'perl-dbd-sqlite' 'perl-file-mimeinfo' 'ttf-linux-libertine'
  'perl-text-csv' 'perl-dbi' 'perl-archive-zip'
  'graphicsmagick' 'texlive-bin' 'texlive-core'
  'gtk2-perl' 'netpbm' 'opencv' 'poppler' 'poppler-glib' 'perl-clone'
zsh:1: command not found: q

source=('https://gitlab.com/jojo_boulix/auto-multiple-choice/uploads/e0b1a6a7541d2187aa230997c865f8b0/auto-multiple-choice_1.4.0-rc1_dist.tar.gz' 'amc.patch')  

md5sums=('8a2f871d67a9c194ce53e29455ded929'
    'd3e490a6785f4df9a26424ee52e7100b')

build() {
  #cd "$srcdir"/$pkgbase-$pkgver
  cd auto-multiple-choice-1.4.0~rc1
  patch -p 1 < $srcdir"/amc.patch"
  #make all_precomp|| return 1
  make PERLDIR=/usr/share/per5/vendor_perl
}

package_auto-multiple-choice(){
  install='amc.install'
  cd auto-multiple-choice-1.4.0~rc1
  make DESTDIR="$pkgdir/" install
}
