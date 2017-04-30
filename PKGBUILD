# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=rustup-shell-completion-hook
pkgver=1.0.0
pkgrel=2
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
md5sums=('e08c7e1b58d36e4ae93c485f85cf2bab'
         '9b5d7d16e46c16e6ffa8507d67867f66'
         '9883d243ad6af1e0e7038cdd526596ab')

package() {
  mkdir -p "${pkgdir}"/etc/pacman.d/hooks
  install -m644 *.hook "${pkgdir}"/etc/pacman.d/hooks/
}
