# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=rustup-shell-completion-hook
pkgver=1.0.0
pkgrel=1
pkgdesc="Pacman hook that generates/updates rustup bash/zsh/fish completion."
arch=(any)
url="https://aur.archlinux.org/packages/rustup-shell-completion-hook"
license=(MIT)
depends=(pacman rustup)
optdepends=('bash: The GNU Bourne Again shell'
            'zsh: A very advanced and programmable command interpreter (shell) for UNIX'
            'fish: Smart and user friendly shell intended mostly for interactive use')
source=(rustup-bash-completion.hook
        rustup-zsh-completion.hook
        rustup-fish-completion.hook)
md5sums=('66fcc09ba400ea333212c5625fd81b01'
         'b3af5fdc4a342f7907506fee66cc48f0'
         '56c9a080268eb21c6008cd5a1320874d')

package() {
  mkdir -p "${pkgdir}"/etc/pacman.d/hooks
  install -m644 *.hook "${pkgdir}"/etc/pacman.d/hooks/
}
