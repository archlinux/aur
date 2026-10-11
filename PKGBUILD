pkgname=nemo-terminal-shortcuts
pkgver=1.0
pkgrel=1
pkgdesc="Change Nemo Terminal Copy & Paste shortcuts to Ctrl-C and Ctrl-V from defaults"
license=('GPL-3.0-or-later')
arch=("x86_64")
depends=('nemo-terminal' 'patch')
source=('https://raw.githubusercontent.com/username227/nemo-terminal-copy-paste/refs/heads/main/apply-shortcuts'
		'https://raw.githubusercontent.com/username227/nemo-terminal-copy-paste/refs/heads/main/nemo-terminal-shortcuts.hook'
		'https://raw.githubusercontent.com/username227/nemo-terminal-copy-paste/refs/heads/main/shortcuts.patch')
sha256sums=('15b9f1680da6bfbc7f39f1ef114b828e6d18c2bc0bb42595baa5c03c1384757a'
            'ba266554575688a994f8e720168b9024b4a82b3c47e3c65ecf439d64d22b60e3'
            '56628294807fdeb6d0aef3b31fd13119d01832a0642f622cc54328217e762e3d')
install=nemo-terminal-shortcuts.install

package() {
    install -Dm644 shortcuts.patch "$pkgdir/usr/share/nemo-terminal-shortcuts/shortcuts.patch"
    install -Dm755 apply-shortcuts "$pkgdir/usr/bin/nemo-terminal-shortcuts-apply"
    install -Dm644 nemo-terminal-shortcuts.hook "$pkgdir/usr/share/libalpm/hooks/nemo-terminal-shortcuts.hook"
}
