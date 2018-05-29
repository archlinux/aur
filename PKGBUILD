# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgbase=cmdpack
pkgname=(cmdpack-bin2ecm cmdpack-bincomp cmdpack-brrrip
         cmdpack-byteshuf cmdpack-cdpatch cmdpack-fakecrc
         cmdpack-hax65816 cmdpack-pecompat cmdpack-rels
         cmdpack-screamf cmdpack-uips cmdpack-vb2rip cmdpack-wordadd)
groups=($pkgbase)
pkgver=1.06
pkgrel=2
pkgdesc="Collection of command line utilities, most for emulation or disk images. (${pkgname[*]/cmdpack-/})"
arch=('i686' 'x86_64')
url="https://github.com/chungy/cmdpack"
license=('GPL3')
makedepends=('asciidoc')
source=("$url/archive/$pkgver.tar.gz"
        0001_symlink-ecm2bin-manpage.patch)
sha512sums=('3fb1a84c3e6f26f1164be3ad0c60334a9adf6b452af81556473104e560d8a9941478aad0d0fe55753f6489e18464a953895034685a82c170919d27d74384a40f'
            '7f8668fb643b7dcb71b8cdcfe5c07456cdafe40d7b941564c8e463f63a26e9b133534a813e0f8643c1b7409d1a142817a653aebea46baea0e2e4675d5ed3f741')

prepare() {
  cd "$pkgbase-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  make ${pkgname[@]/cmdpack-/}

  for _pkg in ${pkgname[@]/cmdpack-/}; do
    make ${_pkg}.1
  done
}

pkgdesc_ext() {
  if ! [[ -d "$pkgbase-$pkgver" ]]; then
    bsdtar -xf "$pkgver.tar.gz"
  fi

  printf %s "$(sed -n 's/"$//g;s/^#define TITLE "'${1}' - // p' "$pkgbase-$pkgver"/${1}.c)"
}

package_cmdpack-bin2ecm() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"
  provides=(ecm-tools)

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-bincomp() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-brrrip() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-byteshuf() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-cdpatch() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-fakecrc() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-hax65816() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-pecompat() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-rels() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-screamf() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-uips() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-vb2rip() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}

package_cmdpack-wordadd() {
  pkgdesc="$(pkgdesc_ext ${pkgname/cmdpack-/})"

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-${pkgname/cmdpack-/}
}
