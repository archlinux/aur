# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=licensecheck
pkgver=3.1.1
pkgrel=1
pkgdesc="Simple license checker for source files"
arch=('any')
url="https://salsa.debian.org/build-common-team/licensecheck"
license=('AGPL')
depends=('perl' 'perl-array-intspan' 'perl-getopt-long-descriptive'
         'perl-list-someutils' 'perl-log-any' 'perl-log-any-adapter-screen'
         'perl-moo' 'perl-moox-struct' 'perl-path-iterator-rule'
         'perl-path-tiny' 'perl-pod-constants' 'perl-regexp-pattern'
         'perl-regexp-pattern-license' 'perl-sort-key' 'perl-string-copyright'
         'perl-string-escape' 'perl-try-tiny' 'perl-namespace-clean'
         'perl-re-engine-re2' 'perl-strictures')
checkdepends=('perl-encode-locale' 'perl-test2-suite' 'perl-test-command-simple'
              'perl-software-license')
source=("https://www.cpan.org/modules/by-module/App/App-Licensecheck-v${pkgver}.tar.gz")
sha512sums=('c84aebc08019128b3aa812ba6e4f93d6d8ec8d6b31a405490609b80f03692d0f95e2ea1f9cad5eea6efa706d7837dca0b8ab1227065e3c5abbfa46e909831ea8')

build() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  make test
}

package() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
