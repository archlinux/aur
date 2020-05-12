# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=licensecheck
pkgver=3.0.46
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
checkdepends=('perl-encode-locale' 'perl-test2-suite' 'perl-test-command-simple')
source=("https://www.cpan.org/modules/by-module/App/App-Licensecheck-v${pkgver}.tar.gz")
sha512sums=('e96f077c44bce2bea29782506164076753e0513bacc1d175dab6f5a871c6809ba2d8fedb1741dd1e14a2befc0f44cc23c79905f84fb1528c22369c5a4bde5e34')

build() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  make test
}

package() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
