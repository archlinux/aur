# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ttf-luciole-mono-git
_fontname=luciole-mono
pkgver=r21.512adfb
pkgrel=1
pkgdesc='Monospace font derived from Luciole for terminals and code editors'
arch=('any')
url='https://scriptor-pro.github.io/luciole-mono/'
license=('CC-BY-4.0')
source=("${_fontname}::git+https://github.com/scriptor-pro/${_fontname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_fontname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/fonts/${_fontname}"
  install -m644 "${srcdir}/${_fontname}"/dist/LucioleMono-*.ttf \
    "${pkgdir}/usr/share/fonts/${_fontname}/"
}
