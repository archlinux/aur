# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fuc-bin'
pkgver=1.1.10
pkgrel=1
pkgdesc='Fast Unix Commands: Modern, performance focused unix commands (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/SUPERCILEX/fuc'
license=('Apache')
provides=('cpz' 'fuc' 'rmz')
conflicts=('cpz' 'fuc' 'rmz' 'fuc-static-musl-bin')
replaces=('fuc-static-musl-bin')
_readme='https://raw.githubusercontent.com/SUPERCILEX/fuc/master/README.md'
source_aarch64=(
  "cpz-aarch64-$pkgver::$url/releases/download/$pkgver/cpz-aarch64-unknown-linux-gnu"
  "rmz-aarch64-$pkgver::$url/releases/download/$pkgver/rmz-aarch64-unknown-linux-gnu"
  "$_readme"
)
source_x86_64=(
  "cpz-x86_64-$pkgver::$url/releases/download/$pkgver/cpz-x86_64-unknown-linux-gnu"
  "rmz-x86_64-$pkgver::$url/releases/download/$pkgver/rmz-x86_64-unknown-linux-gnu"
  "$_readme"
)
noextract=(
  "cpz-$CARCH-$pkgver"
  "rmz-$CARCH-$pkgver"
)
depends=('gcc-libs' 'glibc')

package() {
  # Be more verbose if standard output is a TTY
  test -t 1 && _verbose='v' || _verbose=''

  for _exe in cpz rmz; do
    install "-${_verbose}Dm0755" "$_exe-$CARCH-$pkgver" "$pkgdir/usr/bin/$_exe"
  done

  install "-${_verbose}Dm0644" "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums_aarch64=(
  '91b6b9c85b3a27643a2b30c9c657af8a8b6a7019708ee9ab89f4fa7bb8579dea'
  '99af30f06bb10d3670dfa2c037ef9bc75e860f58ba1047a3d0dc1aca125e674b'
  'SKIP'
)

sha256sums_x86_64=(
  'c9bb761c689e8a8b53ddc1f38f5d42a9db382674b176e715f760ccbcf77fb156'
  '1698e266414f3924de89bfe270be83af1fcc1c7b9343434553f2458eeb0ceadd'
  'SKIP'
)

# 🪷 Beyond the Known — 365 Days of Exploration
#
# 📆 10th December
#
# If one is All One, there is only connection; not I am
# connected.
#
# 🔗 https://magnetic-ink.dk/users/btk

# eof
