# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname="tmux-solarized16"
pkgver="20131028"
pkgrel="1"
pkgdesc="Solarized in 16 colors for tmux"
arch=("any")
url="https://github.com/seebi/tmux-colors-solarized"
license=("MIT")
depends=("tmux")
conflicts=("tmux-solarized-git")
source=("git+$url#commit=8d9edb6")
md5sums=('SKIP')
build () 
{ 
    cd 'tmux-colors-solarized';
    mv 'tmuxcolors-256.conf' 'solarized-256.conf';
    mv 'tmuxcolors-light.conf' 'solarized-light.conf';
    mv 'tmuxcolors-dark.conf' 'solarized-dark.conf'
}
package () 
{ 
    cd 'tmux-colors-solarized';
    install -Dm644 -t "$pkgdir/usr/share/tmux" *.conf
}
