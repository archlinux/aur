# Maintainer: András Wacha <awacha at gmail>
pkgname=demeter
pkgver=0.9.25
pkgrel=1
pkgdesc="Demeter is a comprehensive system for processing and analyzing X-ray Absorption Spectroscopy data."
arch=('i686' 'x86_64')
url="https://bruceravel.github.io/demeter/"
license=('GPL')
depends=('ifeffit' 'pgplot' 'perl-archive-zip' 'perl-capture-tiny' 
	'perl-config-ini' 'perl-const-fast' 'perl-datetime' 'perl-file-touch' 
	'perl-graph' 'perl-heap' 'perl-list-moreutils' 'perl-moose'
	'perl-moosex-types' 'perl-pdl-nohdf4' 'perl-pod-pom' 
	'perl-regexp-common' 'perl-statistics-descriptive' 'perl-text-template'
	'perl-text-unidecode' 'perl-tree-simple' 'perl-want' 'perl-xmlrpc-lite'
	'perl-wx' 'perl-chemistry-elements' 'perl-encoding-fixlatin'
	'perl-file-countlines' 'perl-math-combinatorics' 'perl-math-derivative'
	'perl-math-random' 'perl-math-round' 'perl-math-spline' 
	'perl-moosex-aliases' 'perl-moosex-types-laxnum' 'perl-pdl-stats'
	'perl-regexp-assemble' 'perl-spreadsheet-writeexcel' 'perl-file-slurper'
	'perl-pod-projectdocs' 'perl-file-monitor-lite' 
	'perl-graphics-gnuplotif' 'perl-term-sk' 'perl-term-twiddle')
makedepends=('perl-module-build')
source=(https://github.com/bruceravel/${pkgname}/archive/${pkgver}.tar.gz
	)
md5sums=()

prepare() {
	cd "$pkgname-$pkgver"
	perl Build.PL
}

build() {
	cd "$pkgname-$pkgver"
	./Build
}

check() {
	cd "$pkgname-$pkgver"
	./Build test
}

package() {
	cd "$pkgname-$pkgver"
#	make DESTDIR="$pkgdir/" install
}
