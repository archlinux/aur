# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=firefox-thunderbird-spell-ru-en-unified
pkgver=1.0.3.1webext
pkgrel=1
pkgdesc="firefox and thunderbird Rus+Eng unified spellcheck/dictionary (no switching). Thunderbird is just a symlink."
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/unified-russian-english-spell/"
license=("GPL3")
groups=('firefox-addons')

noextract=("${source##*/}")
source=("https://addons.mozilla.org/firefox/downloads/file/1163957/addon-$pkgver.xpi")
sha512sums=(6b74c3764468a091e65b985aa2bf7ea1ad57419e82218bedc5e227c8e8c6160ac6b33e2c177182f668ab7e2360ed185d9f046ff2cb5b513c4e47a58969248530)

package() {
  # firefox
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/ruspell-extended@addons.mozilla.org.xpi

  # thunderbird (symlink)
  mkdir -p "$pkgdir"/usr/lib/thunderbird/extensions
  ln -s \
    /usr/lib/firefox/browser/extensions/ruspell-extended@addons.mozilla.org.xpi \
    "$pkgdir"/usr/lib/thunderbird/extensions/ruspell-extended@addons.mozilla.org.xpi
}
