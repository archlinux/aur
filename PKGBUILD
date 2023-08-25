# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=uniextract2
pkgver=2.0.0.3
pkgrel=1
pkgdesc='A tool to extract files from any type of archive or installer (Wine)'
arch=('x86_64')
url='https://github.com/Bioruebe/UniExtract2'
license=('GPL2')
depends=('wine')
source=($url/releases/download/v2.0.0-rc.3/UniExtractRC3.zip
        "$pkgname.desktop"
        "$pkgname")
sha256sums=('03170680b80f2afdf824f4d700c11b8e2dac805a4d9bd3d24f53e43bd7131c3a'
            'd8caaa5a466e0e29f10fa1a2d716a6f47280281c55c971a05aa3fdf3a25e04bc'
            'ee46143fcc257a373cdea5c0683c6c78325dd33b0c58fbfb71c79e5af464711d')

prepare() {
        echo "! This package creates a directory '~/.local/share/wineprefixes/uniextract2' in the home directory for a Wine prefix (if it doesn't exist)."
    sleep 2 && echo "Continuing the installation.." && sleep 2
    mkdir -p $HOME/.local/share/wineprefixes/$pkgname
}

package() {
  # Create a folder
  mkdir -p "$pkgdir/opt/UniExtract2"
  # Install
  install -Dm644 UniExtract/support/Icons/uniextract.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 $pkgname -t "$pkgdir/usr/bin"
  mv UniExtract/* "$pkgdir/opt/UniExtract2"
}
