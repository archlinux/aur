# Maintainer: osha <osha@example.com>

pkgname=ssh-manager-tui
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal-based SSH connection manager with a modern color interface"
arch=('any')
url="https://github.com/zsh-ncursed/ssh_manager_tui"
license=('GPL-3.0-or-later')
depends=('openssh' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zsh-ncursed/ssh_manager_tui/archive/11d638ec9e100850a31892a9781b7714549a608b.tar.gz")
sha256sums=('dbabbe96d0dcd78ed34a06c07f0af80313ddd573525490de1210cd20f21d45a6')

prepare() {
    cd "$srcdir/ssh_manager_tui-11d638ec9e100850a31892a9781b7714549a608b"
}

build() {
    cd "$srcdir/ssh_manager_tui-11d638ec9e100850a31892a9781b7714549a608b"
    # Ничего не нужно компилировать - это bash скрипт
}

package() {
    cd "$srcdir/ssh_manager_tui-11d638ec9e100850a31892a9781b7714549a608b"
    
    # Установка основного скрипта
    install -Dm755 "ssh_manager_tui.sh" "$pkgdir/usr/bin/ssh-manager-tui"
    
    # Установка документации
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
