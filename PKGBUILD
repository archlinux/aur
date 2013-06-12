# Maintainer: Johannes Löthberg <demizide@gmail.com>
# Contributor: StephenB <mail4stb at gmail dot com>

pkgname="urxvt-tabbedex"
pkgver=0.4
pkgrel=2
pkgdesc="tabbed extension for rxvt-unicode (urxvt) with several extra features, pathed for perl 5.18"
arch=("any")
url='http://github.com/stepb/urxvt-tabbedex'
license=("GPL")
depends=('rxvt-unicode')
replaces=('rxvt-unicode-256color-named-tabs')
install=urxvt-tabbedex.install
source=("https://github.com/stepb/urxvt-tabbedex/tarball/tabbedex-$pkgver"
        '0001-make-urxvt-tabbedex-work-with-perl-5.18.patch')
md5sums=('d8c165ae73ae4fa8008e9658c415846d'
         '92d581a40779da3127c88fdc7d10257f')

prepare() {
  cd ${srcdir}/stepb-urxvt-tabbedex-f9490d8

  patch tabbedex ../0001-make-urxvt-tabbedex-work-with-perl-5.18.patch
}

package() {
  install -Dm644 ${srcdir}/stepb-urxvt-tabbedex-f9490d8/tabbedex \
      ${pkgdir}/usr/lib/urxvt/perl/tabbedex
}
