pkgname=boot-repair-andres
pkgver=0.1.2
pkgrel=1
pkgdesc="Swiss-army live rescue tool: GRUB repair, display reset, initramfs, kernel, system update, boot freedom, diagnostics."
arch=('any')
license=('MIT')
depends=('bash' 'git')
makedepends=('git')

source=("git+https://github.com/AndresDev859674/boot-repair.git"
        "boot-repair-andres.desktop"
        "boot-repair-andres.png")
url="https://github.com/AndresDev859674/boot-repair"
sha256sums=('SKIP'
            'SKIP' # for boot-repair-andres.desktop
            'SKIP') # for com.andresdev859674.boot-repair.policy
optdepends=('git: For Update and Others Things')

source=("git+https://github.com/AndresDev859674/boot-repair.git"
        "boot-repair-andres.desktop"
        "com.andresdev859674.boot-repair.policy")

package() {
    install -Dm755 "$srcdir/boot-repair/boot-repair.sh" \
        "$pkgdir/usr/bin/boot-repair"

    install -Dm644 "$srcdir/boot-repair-andres.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/boot-repair-andres.png"
        
    install -Dm644 "$srcdir/boot-repair-andres.desktop" \
        "$pkgdir/usr/share/applications/boot-repair-andres.desktop"

    install -Dm644 "$srcdir/com.andresdev859674.boot-repair.policy" \
        "$pkgdir/usr/share/polkit-1/actions/com.andresdev859674.boot-repair.policy"
}
