
  pkgname=ferrumpix-bin
  pkgver=0.9.2
  pkgrel=3
  pkgdesc='Desktop photo manager and image editor built with Avalonia UI'
  arch=('x86_64')
  url='https://github.com/Bitpainter75/FerrumPix'
  license=('GPL-3.0-only')
  depends=('glibc' 'zlib' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'libxkbcommon' 'libice' 'libsm')
  optdepends=('vlc: video thumbnails and playback')
  provides=('ferrumpix')
  conflicts=('ferrumpix')
  options=('!strip')

  source=("https://github.com/Bitpainter75/FerrumPix/releases/download/${pkgver}/FerrumPix-${pkgver}-linux-x64.zip"
          "io.github.Bitpainter75.FerrumPix.desktop"
          "io.github.Bitpainter75.FerrumPix.png")
sha256sums=('6ed063c342007b9397a121bc231b9b7c9b68c296c777bf57e7f463dbd3003778'
            '02a23d27b0ea478bc951de3baebc4b30ec303f679fb137322fdf56b957104321'
            'c621a95fca97c22495bb05ae9753391c5523ac0fce8f16f64b3713515e664067')

  package() {
    install -dm755 "$pkgdir/opt/ferrumpix"
    cp -a "$srcdir"/* "$pkgdir/opt/ferrumpix/"

    rm -f "$pkgdir/opt/ferrumpix/"{*.desktop,*.png,LICENSE,*.zip}
    chmod +x "$pkgdir/opt/ferrumpix/FerrumPix"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/ferrumpix/FerrumPix "$pkgdir/usr/bin/ferrumpix"

    install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPix.desktop" \
      "$pkgdir/usr/share/applications/io.github.Bitpainter75.FerrumPix.desktop"

    install -Dm644 "$srcdir/io.github.Bitpainter75.FerrumPix.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.Bitpainter75.FerrumPix.png"
  }
