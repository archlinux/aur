pkgname=boot-repair-andres
pkgver=0.1.2.1
pkgrel=1
pkgdesc="Swiss-army live rescue tool: GRUB repair, display reset, initramfs, kernel, system update, boot freedom, diagnostics."
arch=('any')
license=('MIT')
depends=('bash' 'git')
makedepends=('git')

source=("git+https://github.com/AndresDev859674/boot-repair.git"
        "boot-repair-andres.desktop"
        "com.andresdev859674.boot-repair.policy"
        "boot-repair-andres.png"
        "boot-repair-andres-128.png")

url="https://github.com/AndresDev859674/boot-repair"
sha256sums=('SKIP'  
            'SKIP'  
            'SKIP'  
            'SKIP'  
            'SKIP')

optdepends=('git: For Update and Others Things')

package() {

    install -Dm755 "$srcdir/boot-repair/boot-repair.sh" \
        "$pkgdir/usr/bin/boot-repair"

    install -d -m755 "$pkgdir/usr/share/boot-repair-andres"
    cp -r "$srcdir/boot-repair/art" \
        "$pkgdir/usr/share/boot-repair-andres/"
        
    install -Dm644 "$srcdir/boot-repair-andres.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/boot-repair-andres.png"
    install -Dm644 "$srcdir/boot-repair-andres-128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/boot-repair-andres.png"

    install -Dm644 "$srcdir/boot-repair-andres.desktop" \
        "$pkgdir/usr/share/applications/boot-repair-andres.desktop"

    install -Dm644 "$srcdir/com.andresdev859674.boot-repair.policy" \
        "$pkgdir/usr/share/polkit-1/actions/com.andresdev859674.boot-repair.policy"
}