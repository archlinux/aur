# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=vcxproj2cmake
_gitname=$pkgname
pkgver=20140728
pkgrel=1
pkgdesc="Convert Visual studio 2010 project(vcxproj) to CMakeFile.txt"
arch=(any)
url="https://github.com/envi/vcxproj2cmake"
license=('Unknown')
depends=('perl-readonly' 'perl-autobox-core' 'perl-try-tiny'
        'perl-xml-treepp' 'perl-xml-treepp-xmlpath'
        'perl-text-xslate' 'perl-data-dumper' )
makedepends=('git')
source=('git+https://github.com/envi/vcxproj2cmake.git')
md5sums=('SKIP')

pkgver() {
  cd  "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  install -Dm755 "$srcdir/$_gitname/vcxproj2cmake.pl" "$pkgdir/usr/bin/vcxproj2cmake"
}

