# Maintainer: Ainola

pkgname=gtk-theme-united-gnome
pkgver=2.2
pkgrel=1
epoch=1
pkgdesc="GTK2/3 + GNOME Shell theme based on a Ubuntu 18.04 design concept."
arch=(any)
url="https://github.com/godlyranchdressing/United-GNOME"
license=('GPL3')
source=("United-Antergos-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Antergos.tar.gz"
        "United-Antergos-Compact-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Antergos-Compact.tar.gz"
        "United-Arch-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Arch.tar.gz"
        "United-Arch-Compact-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Arch-Compact.tar.gz"
        "United-Debian-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Debian.tar.gz"
        "United-Debian-Compact-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Debian-Compact.tar.gz"
        "United-Fedora-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Fedora.tar.gz"
        "United-Fedora-Compact-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Fedora-Compact.tar.gz"
        "United-Latest-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Latest.tar.gz"
        "United-Latest-Compact-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Latest-Compact.tar.gz"
        "United-Manjaro-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Manjaro.tar.gz"
        "United-Manjaro-Compact-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Manjaro-Compact.tar.gz"
        "United-OpenSUSE-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-OpenSUSE.tar.gz"
        "United-OpenSUSE-Compact-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-OpenSUSE-Compact.tar.gz"
        "United-Solus-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Solus.tar.gz"
        "United-Solus-Compact-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Solus-Compact.tar.gz"
        "United-Ubuntu-alt-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Ubuntu-alt.tar.gz"
        "United-Ubuntu-alt-Compact-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Ubuntu-alt-Compact.tar.gz")
sha256sums=('66aba18e52b94e21eacd441627478e1a72493d3913aebae0c8e630f72f8ed3a2'
            'e44c211d86f8215901503f7e021b23cf83da0814bd887300d1b2aca392ae91db'
            'cb2747bccef45c6a14daf915a9ec5296e5572f2557dbc2408816499f69113a45'
            'cc8c7c4317744510bc014bbfd62ce5cb29a525d45fe7d78a6fb797078e6a32de'
            '78d93259d9b79db15d06e8fc54fbdcc289b9340fdde07c2e2416484ee3457b25'
            '5d5060874e4bbdc64167d1fb77da4ecc8ea398d76dbfbeb7ef99b81e2e8644cf'
            '4543a428428ee45a161f6dcc93578a0bc1f99b703c8fb9d6f590338a9330c76c'
            'd03f92b577c5453af565312af3b2961a027e7e872e1a7a65ddae1c4d29d29377'
            '9e9cb33f3ca3fe1bb41022202261b6fb0f94285ada01bb5b0e18970c45181a4a'
            '2f45c8826712a0b308c0ce8a29954ddafdf158480ec516ed0162a525d3c6f5fc'
            '8d1d32d9b8862c955909f14d2354ed1db662a18177b9112eec6ca56837b102fa'
            'bbf651be4a9b292464b5a606fe735f85deb329ebcbfae503a3aa37b17bc9ae4e'
            '5399e08be5844fa0bb734e5e87c885d33839ab0217242275be33bcfaeecc54b0'
            '3b9fcd219687dbb6531c5c657f1ba4c2118277bad14627c373146f6209fb21a5'
            '2ba5e116977c3346578ea9607ce47396ca2033717ba978f33874b4461f51d336'
            '4f128155c9f10aef93ce5b51ddb2f9a507836ea3eeb7e495e7ab36788b54c990'
            'd1a9474e2e3c9b0431429c8c430e31e20daa6e2008cfcf98fe0dc6801fb89ea7'
            '9d116f5561dbff894507bfabae0a03b4c8e934b1db0c79b8f359359c824a5840')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  # Upstream names tend to differ between releases: So that users don't have to
  # constantly re-apply their themes, let's just agree on the following format
  # in case it changes again: United-<distro><-variant> (e.g. United-Arch or
  # United-Arch-Darker).

  # Note that 'United-Latest' means 'Ubuntu'

  # Dirs in $srcdir are installable themes; however, we want to ignore symlinks
  find "$srcdir" -mindepth 1 -maxdepth 1 -type d -exec \
    cp -rt "$pkgdir/usr/share/themes/" {} +
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
