# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='tuc-bin'
_pkgname=${pkgname%%-bin}
pkgver=1.1.0
pkgrel=1
pkgdesc='A more powerful alternative to cut, when cut doesn’t cut it (pre-compiled)'
arch=('x86_64')
url='https://github.com/riquito/tuc'
_rawurl='https://github.com/riquito/tuc/raw/master'
license=('GPL3')
source=(
  "tuc-$pkgver::$url/releases/download/v$pkgver/tuc-linux-amd64"
  "$_rawurl/CHANGELOG.md"
  "$_rawurl/README.md"
  "$_rawurl/doc/tuc.1"
)
depends=('gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 "tuc-$pkgver" "$pkgdir/usr/bin/tuc"

  for mdname in {CHANGELOG,README}.md; do
    install -Dm0644 "$mdname" "$pkgdir/usr/share/doc/$pkgname/$mdname"
  done

  install -Dm0644 tuc.1 "$pkgdir/usr/share/man/man1/tuc.1"
}

sha256sums=(
  'ef59a13728205c9008bace27f782882a39293e4ba1b2ddd67a66d9456487bd7c'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '4f6af9ff5ae202822d6942e70ea37607654655b2af3531c93016219259143651c27c97cf81b24d2579ae87f79aa6a6d9c0d1e76f970e3f596f686ff3c07de7b5'
  'SKIP' 'SKIP' 'SKIP'
)

# 🪷 Beyond the Known — 365 Days of Exploration
#
# 📆 2nd December
#
# You will never be free someday. It will never happen.
#
# You can only be free now, in every possible moment.
#
# Now does not include someday.
#
# 🔗 https://magnetic-ink.dk/users/btk

# eof
