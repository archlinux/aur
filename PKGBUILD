# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=systemd-ssh-agent
pkgver=1.1.0
pkgrel=2
pkgdesc="A systemd user unit for the ssh-agent service"
url="https://wiki.archlinux.org/index.php/SSH_keys#Start_ssh-agent_with_systemd_user"
license=('GPL')
arch=('any')
conflicts=('openssh')
install=ssh-agent.install
source=('ssh-agent.service' 'ssh-auth-sock.sh')
sha256sums=('5768bc9dd781f1a12229bcc1dacacd24569de1829d791cd0e8cc836a58702cec' 'c04f183ce1b97cb225aea1db2ae908dc70669066935717ea3d5b171bc10455a0')

package() {
  install -Dm644 "$srcdir"/ssh-agent.service "$pkgdir"/usr/lib/systemd/user/ssh-agent.service
  install -Dm644 "$srcdir"/ssh-auth-sock.sh "$pkgdir"/etc/profile.d/ssh_auth_sock.sh
}
