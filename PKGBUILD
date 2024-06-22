pkgname=paczf
pkgver=1.0.0
pkgrel=2
pkgdesc='A TUI frontend for pacman/paru using fzf'
arch=('any')
license=('MPL-2.0')
depends=('sh' 'fzf' 'paru' 'pacman' 'less')
package() {
    echo "#!/bin/env sh\nparu -Slq | fzf --preview 'paru -Si {}' --layout=reverse --bind 'enter:execute(paru -S {})+accept'" > ${pkgdir}/usr/bin/pacget
    echo "#!/bin/env sh\nparu -Qq | fzf --preview 'paru -Si {}' --layout=reverse --bind 'enter:execute(paru -Rnsc {})+accept'" > ${pkgdir}/usr/bin/pacrm
    echo "#!/bin/env sh\nparu -Qq | fzf --preview 'paru -Si {}' --layout=reverse --bind 'enter:execute(paru -Sl {})+accept'" > ${pkgdir}/usr/bin/pacls
    chmod 755 ${pkgdir}/usr/bin/pacget
    chmod 755 ${pkgdir}/usr/bin/pacrm
    chmod 755 ${pkgdir}/usr/bin/pacls
}
