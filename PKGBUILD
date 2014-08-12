pkgname=urxvt-tabbedex
pkgver=0.4
pkgrel=3

pkgdesc="A tabbed extension for rxvt-unicode with several enhancements"
url='http://github.com/stepb/urxvt-tabbedex'
arch=("any")
license=("GPL")

depends=('rxvt-unicode')
makedepends=('git')

provides=('urxvt-tabbedex')
conflicts=('urxvt-tabbedex')

install=urxvt-tabbedex.install
source=('git+https://github.com/stepb/urxvt-tabbedex.git#tag=tabbedex-0.4'
        '0001-make-urxvt-tabbedex-work-with-perl-5.18.patch'
        'urxvt-tabbedex.install')

md5sums=('SKIP'
         '92d581a40779da3127c88fdc7d10257f'
         '6ea57fa7db9cc912b3759f1ef8c064b0')

prepare() {
	cd urxvt-tabbedex
	git apply ../0001-make-urxvt-tabbedex-work-with-perl-5.18.patch
}

package() {
	install -Dm644 urxvt-tabbedex/tabbedex "$pkgdir"/usr/lib/urxvt/perl/tabbedex
}
