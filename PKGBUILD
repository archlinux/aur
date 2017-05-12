# Maintainer: Ainola

pkgname=gtk-theme-united-gnome
pkgver=2.0.1
pkgrel=1
epoch=1
pkgdesc="Based on a Ubuntu 18.04 design concept Flat-Plat as a base."
arch=(any)
url="https://github.com/godlyranchdressing/United-GNOME"
license=('GPL3')
source=("https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Arch.tar.xz"
        "https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Fedora.tar.xz"
        "https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Manjaro.tar.xz"
        "https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-OpenSUSE.tar.xz"
        "https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Solus.tar.xz"
        "https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Ubuntu.tar.xz")
sha256sums=('db8d64761bfab809b364df837a56d47720c8c8c7b7783794ea7169460bb7d458'
            'c3140173495f884ec3480f1aeea4797fe9e9f1a27c6eeeacfb9ee1de38c8d07f'
            'f9b1c34a356d780e05aecf23ebeb37f4b5405c31a379e6df2700a73d7b44420e'
            '59e29673fbc167a11b4dba0cd1fe0cc27d409a32c19b424664e8f82012c9a18e'
            '8756909451ea72ca5e40a10e1f1a9ba4c4e154c4e8c077aec0af094c77708637'
            '9544ded13aca9fccffb072c6e19234a055193083ef58875e0ee8989af1e78837')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  # Upstream names tend to differ between releases: So that users don't have to
  # constantly re-apply their themes, let's just agree on the following format
  # in case it changes again: United-<distro><-variant> (e.g. United-Arch or
  # United-Arch-Darker)
  for distro in Arch Fedora Manjaro Opensuse Solus Ubuntu; do
    cp -r "$srcdir/United-$distro"/* "$pkgdir/usr/share/themes/"
  done
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
